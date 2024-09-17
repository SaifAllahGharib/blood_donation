import 'package:blooddoman_clean/features/blood_donation/presentation/views/widgets/blood_donation_view_body.dart';
import 'package:flutter/material.dart';

class BloodDonationView extends StatelessWidget {
  static const id = "/blood_donation_view";

  const BloodDonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BloodDonationViewBody(),
      ),
    );
  }
}
