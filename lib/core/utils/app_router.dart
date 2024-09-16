import 'package:blooddoman_clean/features/home/presentation/views/home_view.dart';
import 'package:blooddoman_clean/features/login/presentaion/views/login_view.dart';
import 'package:blooddoman_clean/features/signup/presentaion/views/signup_view.dart';
import 'package:blooddoman_clean/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: LoginView.id,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: SignupView.id,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: HomeView.id,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
