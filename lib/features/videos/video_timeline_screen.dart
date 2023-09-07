import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

List<Color> colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = colors.length;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 7;
      colors.addAll([
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
      ]);
      setState(() {});
    }
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
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            "Screen $index",
            style: const TextStyle(fontSize: Sizes.size64),
          ),
        ),
      ),
    );
  }
}
