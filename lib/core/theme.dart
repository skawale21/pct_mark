import 'package:flutter/material.dart';
import 'package:pct_mark/core/app_pallette.dart';

class AppTheme {
  static final lightThemeMode = ThemeData(
    primarySwatch: Colors.teal,
  ).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppPallette.mainColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppPallette.mainColor,
      iconTheme:
          IconThemeData(color: Colors.white), // Set back arrow color to white
      titleTextStyle: TextStyle(
        color: Colors.white, // Set app bar title text color to white
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      toolbarTextStyle: TextStyle(
        color: Colors
            .white, // Set toolbar text color to white (for AppBar actions)
        fontSize: 18,
      ),
    ),
    listTileTheme: const ListTileThemeData(horizontalTitleGap: 2),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.teal, // Color of selected tab name
      unselectedLabelColor: Colors.grey, // Color of unselected tab names
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.teal, width: 2), // Color of the underline
        ),
      ),
    ),
  );
}
