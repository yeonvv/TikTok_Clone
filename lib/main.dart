import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/authentication/sing_up_screen.dart';
import 'package:dart_tiktok/features/onboarding/interests_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w900,
          ),
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const InterestsScreen(),
    );
  }
}
