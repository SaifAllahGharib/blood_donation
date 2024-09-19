import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:blooddoman_clean/core/widgets/custom_back_button.dart';
import 'package:blooddoman_clean/core/widgets/custom_image_profile.dart';
import 'package:blooddoman_clean/core/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonorProfileViewBody extends StatelessWidget {
  const DonorProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CustomBackButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
            const SizedBox(height: 30),
            const CustomImageProfile(color: primaryColor),
            const SizedBox(height: 20),
            const Text(
              "سيف الله غريب",
              style: Styles.textStyle27,
            ),
            const SizedBox(height: 40),
            const CustomRow(
              title: "فصيله الدم",
              disc: "A+",
              color: Colors.black,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 10),
            const CustomRow(
              title: "الرقم",
              disc: "01014890911",
              color: Colors.black,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 20),
            Text(
              "العنوان",
              style: Styles.textStyle27.copyWith(color: primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              "القاهره حلوان الدواجن شارع سلاح المهندسين بجوار بوابه الجيش عماره الحج نبوري",
              style: Styles.textStyle27,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
