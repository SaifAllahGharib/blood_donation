import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:blooddoman_clean/core/widgets/custom_button.dart';
import 'package:blooddoman_clean/core/widgets/custom_text_form_field.dart';
import 'package:blooddoman_clean/core/widgets/regiser_widget_top.dart';
import 'package:blooddoman_clean/features/signup/presentaion/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        enableFeedback: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 80, left: 20, bottom: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const RegisterWidgetTop(
                title: "مرحبا بعودتك",
                disc: "تسجيل الدخول",
              ),
              CustomTextFormField(
                controller: emailController,
                textHint: "البريد الالكتروني",
                icon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: passwordController,
                textHint: "كلمه السر",
                icon: const Icon(Icons.lock_outline),
                isPassword: true,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "هل نسيت كلمة المرور؟",
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const CustomButton(text: "تسجيل الدخول"),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(SignupView.id);
                    },
                    child: const Text(
                      "انشاء حساب",
                      style: Styles.textStyle14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "هل انت مستخدم جديد؟",
                    style: Styles.textStyle14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
