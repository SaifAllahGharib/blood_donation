import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500),
          ),
          padding: const EdgeInsets.all(15),
          color: primaryColor,
          child: Text(
            text,
            style: Styles.textStyle17,
          ),
        ),
      ),
    );
  }
}
