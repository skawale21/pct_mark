import 'package:flutter/material.dart';
import 'package:pct_mark/core/theme.dart';
import 'package:pct_mark/features/auth/presentation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Care Taker',
      theme: AppTheme.lightThemeMode,
      home: const LoginScreen(),
    );
  }
}
