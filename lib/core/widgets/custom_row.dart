import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String disc;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRow({
    super.key,
    required this.title,
    required this.disc,
    this.color = Colors.white,
    this.mainAxisAlignment = MainAxisAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Expanded(
          child: Text(
            disc,
            style: Styles.textStyle14.copyWith(color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
        Text(
          " : $title",
          style: Styles.textStyle17
              .copyWith(
                fontWeight: FontWeight.w600,
              )
              .copyWith(color: color),
        ),
      ],
    );
  }
}
