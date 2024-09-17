import 'package:blooddoman_clean/features/blood_request/presentaion/views/widgets/blood_request_view_body.dart';
import 'package:flutter/material.dart';

class BloodRequestView extends StatelessWidget {
  static const id = "/blood_request_view";

  const BloodRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BloodRequestViewBody(),
      ),
    );
  }
}
