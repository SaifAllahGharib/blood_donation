import 'package:blooddoman_clean/features/signup/presentaion/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  static const id = "/signup_view";

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignupViewBody(),
      ),
    );
  }
}
