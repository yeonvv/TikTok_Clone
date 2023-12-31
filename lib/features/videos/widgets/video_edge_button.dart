import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoEdgeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const VideoEdgeButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Sizes.size24,
      ),
      child: Column(
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: Sizes.size28,
          ),
          Gaps.v3,
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
