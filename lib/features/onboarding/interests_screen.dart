import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
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

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose your interests",
        ),
      ),
      body: SingleChildScrollView(
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
                  for (var interst in interests)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size16,
                        horizontal: Sizes.size20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ]),
                      child: Text(
                        interst,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
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
                      vertical: Sizes.size10,
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
