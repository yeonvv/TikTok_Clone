import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/main_navigation/main_navigation_screen.dart';
import 'package:flutter/material.dart';

enum Direction { up, down }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.up;
  Page _page = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy > 0 && details.delta.dy < 1) {
      _direction = Direction.up;
    } else if (details.delta.dy < 0 && details.delta.dy > -1) {
      _direction = Direction.down;
    }
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    _direction == Direction.up ? _page = Page.first : _page = Page.second;
    setState(() {});
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: SafeArea(
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _page == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const FadePage(
                title: "Watch cool videos!",
                description:
                    "Videos are personalized for you based on what you watch, like, ande share.",
              ),
              secondChild: const FadePage(
                title: "Follow the rules",
                description: "Take care of one another! plis!",
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size20,
              bottom: Sizes.size40,
              right: Sizes.size32,
              left: Sizes.size32,
            ),
            child: GestureDetector(
              onTap: _page == Page.first ? null : _onEnterAppTap,
              child: AnimatedOpacity(
                opacity: _page == Page.first ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size3),
                  ),
                  child: const Text(
                    "Enter the app!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // length: 3,
      // child: Scaffold(
      //   body: const SafeArea(
      //     child: TabBarView(
      //       children: [
      //         Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: Sizes.size40,
      //             vertical: Sizes.size20,
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Watch cool videos!",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size36,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //               Gaps.v14,
      //               Text(
      //                 "Videos are personalized for you based on what you watch, like, ande share.",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size20,
      //                   color: Colors.black54,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: Sizes.size40,
      //             vertical: Sizes.size20,
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Watch cool videos!",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size36,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //               Gaps.v14,
      //               Text(
      //                 "Videos are personalized for you based on what you watch, like, ande share.",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size20,
      //                   color: Colors.black54,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: Sizes.size40,
      //             vertical: Sizes.size20,
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Watch cool videos!",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size36,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //               Gaps.v14,
      //               Text(
      //                 "Videos are personalized for you based on what you watch, like, ande share.",
      //                 style: TextStyle(
      //                   fontSize: Sizes.size20,
      //                   color: Colors.black54,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //       padding: const EdgeInsets.only(
      //         top: Sizes.size20,
      //         bottom: Sizes.size40,
      //         right: Sizes.size32,
      //         left: Sizes.size32,
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           TabPageSelector(
      //             selectedColor: Theme.of(context).primaryColor,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class FadePage extends StatelessWidget {
  final String title;
  final String description;

  const FadePage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 감싸는 이유는 Text 박스가 끝까지 채워져 있지 않아 다른 페이지가의 Text가 순간적으로 개행되는 것을 막기 위해
      widthFactor: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v60,
          Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size36,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v14,
          Text(
            description,
            style: const TextStyle(
              fontSize: Sizes.size20,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
