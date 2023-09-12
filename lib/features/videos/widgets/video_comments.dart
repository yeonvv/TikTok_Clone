import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/videos/widgets/comment_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onClosePressd() {
    Navigator.of(context).pop();
  }

  void _onBodyTap() {
    FocusScope.of(context).unfocus();
    _isWriting = false;
    setState(() {});
  }

  void _onStartWrite() {
    _isWriting = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Sizes.size20),
        ),
      ),
      child: GestureDetector(
        onTap: _onBodyTap,
        child: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            backgroundColor: Colors.white10,
            title: const Text("22796 comments"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: _onClosePressd,
                icon: const FaIcon(
                  FontAwesomeIcons.x,
                  size: Sizes.size16,
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              Scrollbar(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    right: Sizes.size16,
                    left: Sizes.size16,
                    top: Sizes.size10,
                    bottom: Sizes.size96,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemBuilder: (context, index) => const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Sizes.size20,
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "username",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.v3,
                            Text(
                                "maksnbfakskj aisnfna aisnfnak  asbasdasdas asdasd as a sd asd"),
                          ],
                        ),
                      ),
                      Gaps.h20,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                            color: Colors.black54,
                          ),
                          Gaps.v1,
                          Text(
                            "52.2k",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: screenSize.width,
                child: BottomAppBar(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Sizes.size16,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size20,
                          backgroundColor: Colors.black26,
                          child: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.white60,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: TextField(
                            onTap: _onStartWrite,
                            maxLines: 4,
                            minLines: 1,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: "Write a comment...",
                              hintStyle: const TextStyle(
                                color: Colors.black38,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size12,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.07),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CommentIcons(
                                    icon: FontAwesomeIcons.at,
                                  ),
                                  const CommentIcons(
                                    icon: FontAwesomeIcons.gift,
                                  ),
                                  const CommentIcons(
                                    icon: FontAwesomeIcons.faceSmile,
                                  ),
                                  if (_isWriting)
                                    const CommentIcons(
                                      icon: FontAwesomeIcons.anglesRight,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
