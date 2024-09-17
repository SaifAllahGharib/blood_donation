import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/widgets/custom_inkwell.dart';
import 'package:blooddoman_clean/core/widgets/custom_text_form_field.dart';
import 'package:blooddoman_clean/features/blood_donation/presentation/views/widgets/custom_row.dart';
import 'package:flutter/material.dart';

class BloodDonationViewBody extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  BloodDonationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(controller: searchController, textHint: "ابحث"),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Card(
                    color: primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CustomRow(
                            title: "الحاله",
                            disc: "لم يتم التبرع",
                          ),
                          CustomRow(
                            title: "الاسم",
                            disc: "سيف الله غريب",
                          ),
                          CustomRow(
                            title: "الرقم",
                            disc: "+201014890911",
                          ),
                          CustomRow(
                            title: "فصيله الدم المطلويه",
                            disc: "A+",
                          ),
                          CustomRow(
                            title: "العنوان",
                            disc:
                                "القاهر جلوان سيبسيبsdfsdfsdfsdfsdfsdfsdfsdfسي",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
