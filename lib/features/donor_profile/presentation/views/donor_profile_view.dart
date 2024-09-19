import 'package:blooddoman_clean/features/donor_profile/presentation/views/widgets/donor_profile_view_body.dart';
import 'package:flutter/material.dart';

class DonorProfileView extends StatelessWidget {
  static const id = "/donor_profile_view";

  const DonorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DonorProfileViewBody(),
      ),
    );
  }
}
