import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: PctColors.whiteColor, // Text color
        backgroundColor: PctColors.mainColor, // Background color
      ),
      child: Text(text),
    );
  }
}
