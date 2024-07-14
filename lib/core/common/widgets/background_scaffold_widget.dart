import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? bottomNavigationBar;

  const BackgroundScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar != null
            ? PreferredSize(
                preferredSize:
                    const Size.fromHeight(60.0), // or any height you prefer
                child: appBar!,
              )
            : null,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

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
