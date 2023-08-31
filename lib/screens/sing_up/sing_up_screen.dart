import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(children: [
            Gaps.v80,
            Text(
              "Sign up for TikTok",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            Text(
              "Create a profile, follow other accounts, make your own videos, and more.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size20,
            bottom: Sizes.size40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Gaps.h5,
              Text(
                "Log in",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
