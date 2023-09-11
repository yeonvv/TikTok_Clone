import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentIcons extends StatelessWidget {
  // final Function onTap;
  final IconData icon;
  const CommentIcons({
    super.key,
    required this.icon,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon,
          color: icon == FontAwesomeIcons.anglesRight
              ? Theme.of(context).primaryColor
              : Colors.black87,
          size: Sizes.size24,
        ),
        Gaps.h14,
      ],
    );
  }
}
