import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final Widget child;

  const CustomInkwell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
