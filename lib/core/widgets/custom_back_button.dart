import 'package:blooddoman_clean/constante.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;

  const CustomBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: primaryColor,
      ),
    );
  }
}
