import 'package:blooddoman_clean/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  final Animation<Offset> animation;

  const SlidingLogo({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => SlideTransition(
        position: animation,
        child: Image.asset(Assets.logo),
      ),
    );
  }
}
