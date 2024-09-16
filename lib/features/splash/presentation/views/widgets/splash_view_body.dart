import 'package:blooddoman_clean/features/login/presentaion/views/login_view.dart';
import 'package:blooddoman_clean/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    _initSlidingLogoAnimation();
    _navigateToView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlidingLogo(animation: animation),
    );
  }

  void _initSlidingLogoAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void _navigateToView() {
    Future.delayed(
      const Duration(milliseconds: 2200),
      () {
        GoRouter.of(context).pushReplacement(LoginView.id);
      },
    );
  }
}
