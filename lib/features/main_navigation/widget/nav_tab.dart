import 'package:dart_tiktok/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationTap extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  const NavigationTap({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(),
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.4,
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: Colors.white,
              ),
              Gaps.v8,
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
