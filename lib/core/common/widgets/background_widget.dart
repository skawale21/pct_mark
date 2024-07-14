import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.white, // Add a background color if needed
          ),
        ),
        Positioned.fill(
          child: SvgPicture.asset(
            PctImages.splashBg,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
