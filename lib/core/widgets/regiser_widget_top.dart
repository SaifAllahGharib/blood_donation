import 'package:flutter/material.dart';

import '../utils/styles.dart';

class RegisterWidgetTop extends StatelessWidget {
  final String title;
  final String disc;

  const RegisterWidgetTop({
    super.key,
    required this.title,
    required this.disc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Text(
          title,
          style: Styles.textStyle27,
        ),
        const SizedBox(height: 60),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            disc,
            style: Styles.textStyle20,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
