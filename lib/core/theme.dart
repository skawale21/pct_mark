import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';
import 'package:pct_mark/core/common/resources/font_manager.dart';

class AppTheme {
  static final lightThemeMode = ThemeData(
    primarySwatch: Colors.teal,
  ).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: PctColors.mainColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: PctColors.mainColor,
      iconTheme: IconThemeData(
          color: PctColors.whiteColor), // Set back arrow color to white
      titleTextStyle: TextStyle(
        color: Colors.white, // Set app bar title text color to white
        fontSize: PctFontSize.s20,
        fontWeight: PctFontWeight.bold,
      ),
      toolbarTextStyle: TextStyle(
        color: PctColors
            .whiteColor, // Set toolbar text color to white (for AppBar actions)
        fontSize: PctFontSize.s18,
      ),
    ),
    listTileTheme: const ListTileThemeData(horizontalTitleGap: 2),
    tabBarTheme: const TabBarTheme(
      labelColor: PctColors.mainColor, // Color of selected tab name
      unselectedLabelColor:
          PctColors.greyColor, // Color of unselected tab names
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PctColors.mainColor,
            width: 2,
          ), // Color of the underline
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Colors.teal, // Set the background color to teal
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}
