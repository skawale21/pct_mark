import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onButtonPress;
  const CustomButton(
      {super.key, required this.title, required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(177, 31, 177, 152)),
      ),
      onPressed: () => onButtonPress(),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
