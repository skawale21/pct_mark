import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/font_manager.dart';

class PctTextStyle {
  static const TextStyle splashHeadingStyle = TextStyle(
    fontFamily: "Poppins",
    fontSize: 18,
    fontWeight: PctFontWeight.semibold,
    color: Color(0xff000000),
    height: 24.970624923706055 / 18,
  );

  TextStyle buttonTextStyle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
