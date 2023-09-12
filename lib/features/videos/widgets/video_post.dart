import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/videos/widgets/video_comments.dart';
import 'package:dart_tiktok/features/videos/widgets/video_edge_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final int index;
  final String description;

  const VideoPost({
    super.key,
    required this.index,
    required this.description,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;

  bool _isPaused = false;
  bool _isShowDesc = false;

  late final AnimationController _animationController;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  // void _onVideoFinished() {
  //   if (_videoPlayerController.value.isInitialized) {
  //     if (_videoPlayerController.value.duration ==
  //         _videoPlayerController.value.position)
  //   }
  // }

  void _initVideo() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    // _videoPlayerController.addListener(_onVideoFinished);
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (!mounted) return;
    // reverse : upperBound를 lowerBound로 애니메이션
    // forward : lowerBound를 upperBound 애니메이션
    _videoPlayerController.value.isPlaying
        ? (_videoPlayerController.pause(), _animationController.reverse())
        : (_videoPlayerController.play(), _animationController.forward());
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onShowDesc() {
    setState(() {
      _isShowDesc = !_isShowDesc;
    });
  }

  void _onCommentsTap() async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      // 닫힐 때 resolve 된다.
      context: context,
      builder: (context) => const VideoComments(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Sizes.size20),
        ),
      ),
      isScrollControlled: true,
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWith = screenSize.width;
    Orientation currentOrientation = Orientation.portrait;

    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: OrientationBuilder(
        builder: (context, orientation) {
          currentOrientation = orientation;
          return Stack(
            children: [
              Positioned.fill(
                child: _videoPlayerController.value.isInitialized
                    ? VideoPlayer(_videoPlayerController)
                    : Container(
                        color: Colors.black,
                      ),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: _onTogglePause,
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        // controller의 값이 변할 때마다 실행된다.
                        return Transform.scale(
                          scale: _animationController.value,
                          child: child,
                        );
                      },
                      child: AnimatedOpacity(
                        duration: _animationDuration,
                        opacity: _isPaused ? 1 : 0,
                        child: const FaIcon(
                          FontAwesomeIcons.play,
                          size: Sizes.size52,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: currentOrientation == Orientation.portrait
                    ? screenWith * 0.04
                    : screenWith * 0.02,
                left: currentOrientation == Orientation.portrait
                    ? screenWith * 0.04
                    : screenWith * 0.02,
                width: currentOrientation == Orientation.portrait
                    ? screenWith * 0.44
                    : screenWith * 0.44,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@YJJ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: currentOrientation == Orientation.portrait
                            ? screenWith * 0.035
                            : screenWith * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    _isShowDesc
                        ? GestureDetector(
                            onTap: _onShowDesc,
                            child: SizedBox(
                              child: Text(
                                widget.description,
                                style: TextStyle(
                                  fontSize:
                                      currentOrientation == Orientation.portrait
                                          ? screenWith * 0.035
                                          : screenWith * 0.025,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width:
                                    currentOrientation == Orientation.portrait
                                        ? screenWith * 0.29
                                        : screenWith * 0.29,
                                child: Text(
                                  widget.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: currentOrientation ==
                                            Orientation.portrait
                                        ? screenWith * 0.035
                                        : screenWith * 0.025,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _onShowDesc,
                                child: Text(
                                  "See more",
                                  style: TextStyle(
                                    fontSize: currentOrientation ==
                                            Orientation.portrait
                                        ? screenWith * 0.035
                                        : screenWith * 0.025,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Gaps.v10,
                  ],
                ),
              ),
              Positioned(
                bottom: 70,
                right: 10,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/3612017?v=4",
                      ),
                      foregroundColor: Colors.white,
                    ),
                    const VideoEdgeButton(
                      icon: FontAwesomeIcons.solidHeart,
                      text: "2.9M",
                    ),
                    GestureDetector(
                      onTap: _onCommentsTap,
                      child: const VideoEdgeButton(
                        icon: FontAwesomeIcons.solidCommentDots,
                        text: "33.0K",
                      ),
                    ),
                    const VideoEdgeButton(
                      icon: FontAwesomeIcons.share,
                      text: "Share",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
