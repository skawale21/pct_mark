import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';
import 'package:pct_mark/core/common/resources/styles_manager.dart';
import 'package:pct_mark/core/common/resources/values_manager.dart';

Widget appLogoTitle = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset(
        PctImages.logo), // Assuming PctImages.logo points to your image asset
    const SizedBox(height: PctAppSize.s20),
    const Text(
      PctStrings.appTitle, // Assuming PctStrings.appTitle is a defined string
      style: PctTextStyle
          .splashHeadingStyle, // Use the defined style from PctTextStyle
      textAlign: TextAlign.left,
    ),
    const SizedBox(height: 20),
  ],
);
