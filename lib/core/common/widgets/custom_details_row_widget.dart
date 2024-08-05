import 'package:flutter/material.dart';

class CustomDetailsRow extends StatelessWidget {
  final String title;
  final String value;
  const CustomDetailsRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          const Expanded(child: Text(":")),
          Expanded(
              child: Text(
            value,
            softWrap: true,
          ))
        ],
      ),
    );
  }
}
