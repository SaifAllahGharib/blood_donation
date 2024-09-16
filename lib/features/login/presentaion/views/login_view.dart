import 'package:blooddoman_clean/features/login/presentaion/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const id = "/login_view";

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}
