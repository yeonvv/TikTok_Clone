import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/onboarding/tutorial_screen.dart';
import 'package:dart_tiktok/features/onboarding/widgets/interests_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 90) {
      if (_showTitle) return; // _showTitle이 true인 경우는 함수에서 빠져나간다.
      _showTitle = true;
    } else {
      _showTitle = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TutorialScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text(
            "Choose your interests",
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
              vertical: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gaps.v40,
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestsButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black12,
        )),
        child: BottomAppBar(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size20,
              bottom: Sizes.size40,
              right: Sizes.size32,
              left: Sizes.size32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size3),
                    ),
                    child: const Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Gaps.h16,
                Expanded(
                  // child: CupertinoButton(
                  //   onPressed: () {},
                  //   color: Theme.of(context).primaryColor,
                  //   child: const Text("Next"),
                  // ),
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size3),
                      ),
                      child: const Text(
                        "Next",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
