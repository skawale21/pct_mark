import 'package:flutter/material.dart';
import 'package:pct_mark/core/widgets/background_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen',
                style: TextStyle(fontSize: 24, color: Colors.black)),
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
