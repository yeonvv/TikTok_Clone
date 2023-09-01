import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled ? false : true,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled ? Colors.black12 : Theme.of(context).primaryColor,
          ),
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: disabled ? Colors.black38 : Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
            duration: const Duration(milliseconds: 300),
            child: const Text(
              "Next",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
