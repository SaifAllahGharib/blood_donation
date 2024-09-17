import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomHomeButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle17.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
