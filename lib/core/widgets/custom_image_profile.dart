import 'package:flutter/material.dart';

class CustomImageProfile extends StatelessWidget {
  final Color color;

  const CustomImageProfile({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: color,
        ),
        borderRadius: BorderRadius.circular(500),
      ),
      child: Icon(
        Icons.person_2_outlined,
        size: 80,
        color: color,
      ),
    );
  }
}
