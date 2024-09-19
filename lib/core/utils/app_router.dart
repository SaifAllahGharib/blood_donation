import 'package:blooddoman_clean/features/blood_donation/presentation/views/blood_donation_view.dart';
import 'package:blooddoman_clean/features/blood_request/presentaion/views/blood_request_view.dart';
import 'package:blooddoman_clean/features/donor_profile/presentation/views/donor_profile_view.dart';
import 'package:blooddoman_clean/features/donor_search/presentation/views/donor_search_view.dart';
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
      GoRoute(
        path: BloodRequestView.id,
        builder: (context, state) => const BloodRequestView(),
      ),
      GoRoute(
        path: BloodDonationView.id,
        builder: (context, state) => const BloodDonationView(),
      ),
      GoRoute(
        path: DonorSearchView.id,
        builder: (context, state) => const DonorSearchView(),
      ),
      GoRoute(
        path: DonorProfileView.id,
        builder: (context, state) => const DonorProfileView(),
      ),
    ],
  );
}
