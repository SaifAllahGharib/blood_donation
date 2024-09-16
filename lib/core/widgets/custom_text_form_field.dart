import 'package:blooddoman_clean/constante.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String textHint;
  final Icon? icon;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputType? textInputType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.textHint,
    this.icon,
    this.onTap,
    this.textInputType,
    this.isPassword = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: textDirection,
      keyboardType: textInputType,
      cursorColor: primaryColor,
      minLines: 1,
      obscureText: false,
      obscuringCharacter: "●",
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintTextDirection: textDirection,
        hintText: textHint,
        hintFadeDuration: const Duration(milliseconds: 500),
        suffixIcon: icon,
        prefixIcon: isPassword
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined),
              )
            : null,
        enabledBorder: _border(color: Colors.grey),
        focusedBorder: _border(color: primaryColor),
      ),
    );
  }

  OutlineInputBorder _border({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
    );
  }
}
