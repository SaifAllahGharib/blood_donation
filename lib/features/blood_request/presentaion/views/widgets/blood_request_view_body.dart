import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/widgets/custom_button.dart';
import 'package:blooddoman_clean/core/widgets/custom_dropdown_menu.dart';
import 'package:blooddoman_clean/core/widgets/custom_inkwell.dart';
import 'package:blooddoman_clean/core/widgets/custom_text_form_field.dart';
import 'package:blooddoman_clean/core/widgets/regiser_widget_top.dart';
import 'package:flutter/material.dart';

class BloodRequestViewBody extends StatefulWidget {
  const BloodRequestViewBody({super.key});

  @override
  State<BloodRequestViewBody> createState() => _BloodRequestViewBodyState();
}

class _BloodRequestViewBodyState extends State<BloodRequestViewBody> {
  final TextEditingController bloodController = TextEditingController();

  final TextEditingController bloodTypeController = TextEditingController();

  bool dropDown = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomInkwell(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const RegisterWidgetTop(title: "طلب تبرع بالدم", disc: "الطلب"),
              CustomTextFormField(
                controller: bloodController,
                textHint: "فصيله الدم",
              ),
              const SizedBox(height: 10),
              CustomDropDownMenu(
                controller: bloodTypeController,
                items: componentType,
                text: "النوع",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: bloodController,
                textHint: "الكميه المطلوبه",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: bloodController,
                textHint: "العنوان بالتفصيل",
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: "ارسال الطلب",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
