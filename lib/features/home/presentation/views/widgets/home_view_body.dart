import 'package:blooddoman_clean/features/home/presentation/views/widgets/custom_grid_view.dart';
import 'package:blooddoman_clean/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomHomeAppBar(),
        ),
        SliverToBoxAdapter(
          child: CustomGridView(),
        ),
      ],
    );
  }
}
