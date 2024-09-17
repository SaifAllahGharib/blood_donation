import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String disc;

  const CustomRow({
    super.key,
    required this.title,
    required this.disc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Text(
            disc,
            style: Styles.textStyle14.copyWith(color: Colors.white),
            textDirection: textDirection,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          " : $title",
          style: Styles.textStyle17.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
