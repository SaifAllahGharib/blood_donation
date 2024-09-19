import 'package:blooddoman_clean/features/donor_search/presentation/views/widgets/donor_search_view_body.dart';
import 'package:flutter/material.dart';

class DonorSearchView extends StatelessWidget {
  static const id = "/donor_search_view";

  const DonorSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DonorSearchViewBody(),
      ),
    );
  }
}
