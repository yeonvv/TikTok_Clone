import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';

class InterestsButton extends StatefulWidget {
  const InterestsButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestsButton> createState() => _InterestsButtonState();
}

class _InterestsButtonState extends State<InterestsButton> {
  bool _isSelected = false;

  void _onTap() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
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
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            widget.interest,
          ),
        ),
      ),
    );
  }
}
