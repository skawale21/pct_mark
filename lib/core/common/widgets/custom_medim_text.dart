import 'package:flutter/material.dart';

class CustomMediumCentreText extends StatelessWidget {
  const CustomMediumCentreText({
    super.key,
    required this.showText,
  });
  final String showText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          showText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
