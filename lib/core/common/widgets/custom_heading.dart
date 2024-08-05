import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';

class CustomHeading extends StatelessWidget {
  final String heading;
  const CustomHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PctColors.mainColor,
      padding: const EdgeInsets.all(8),
      width: double.maxFinite,
      child: Text(heading,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
