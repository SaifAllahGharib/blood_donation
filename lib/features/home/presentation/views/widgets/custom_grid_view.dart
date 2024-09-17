import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/features/home/presentation/views/widgets/custom_home_button.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items = [
    "تبرع بالدم",
    "طلب التبرع",
    "البحث عن متبرعين",
    "معلوماتك",
  ];

  CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomHomeButton(
            text: items[index],
            onPressed: () {},
          );
        },
      ),
    );
  }
}
