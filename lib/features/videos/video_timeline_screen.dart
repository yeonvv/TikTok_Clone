import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/videos/widgets/video_post.dart';
import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  int _itemCount = 4;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 7;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MainNavigationScreen의 Scaffold안에서 렌더링되고, Appbar가 없기 때문에 Scaffold를 사용할 이유가 없다.
    return PageView.builder(
      controller: _pageController,
      pageSnapping: true,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) =>
          VideoPost(onVideoFinished: _onVideoFinished, index: index),
    );
  }
}
