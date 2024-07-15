import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message) {
  // Hide current snackbar if visible
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
        // Dismiss the snackbar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
