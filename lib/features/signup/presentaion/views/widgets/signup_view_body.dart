import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/widgets/custom_button.dart';
import 'package:blooddoman_clean/core/widgets/custom_dropdown_menu.dart';
import 'package:blooddoman_clean/core/widgets/custom_text_form_field.dart';
import 'package:blooddoman_clean/core/widgets/regiser_widget_top.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodTypesController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController illnessController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        enableFeedback: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: primaryColor,
                ),
              ),
              const RegisterWidgetTop(
                title: "انشاء حساب",
                disc: "تسجيل",
              ),
              CustomTextFormField(
                controller: usernameController,
                textHint: "الاسم بالكامل",
                icon: const Icon(Icons.person_2_outlined),
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: emailController,
                textHint: "البريد الالكتروني",
                icon: const Icon(Icons.email_outlined),
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: phoneController,
                textHint: "رقم الهاتف",
                icon: const Icon(Icons.phone_android_outlined),
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: ageController,
                textHint: "عمرك",
                icon: const Icon(Icons.timer_outlined),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomDropDownMenu(
                controller: bloodTypesController,
                text: "فصيله الدم",
                items: bloodTypes,
              ),
              const SizedBox(height: 10),
              CustomDropDownMenu(
                controller: countryController,
                text: "المحافظه",
                items: egyptGovernorates,
              ),
              const SizedBox(height: 10),
              CustomDropDownMenu(
                controller: illnessController,
                text: "هل عند مرض معين",
                items: illness,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: passwordController,
                textHint: "كلمه السر",
                icon: const Icon(Icons.lock_outline),
                isPassword: true,
              ),
              const SizedBox(height: 40),
              const CustomButton(text: "انشاء حساب"),
            ],
          ),
        ),
      ),
    );
  }
}
