import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';

Widget appLogoTitle = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset(PctImages.logo),
    const SizedBox(height: 20),
    const Text(
      PctStrings.appTitle,
      // style: splashHeadingStyle,
      textAlign: TextAlign.left,
    ),
    const SizedBox(
      height: 20,
    ),
  ],
);
