

import 'package:e_market/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_market/features/auth/presentation/views/login_view.dart';
import 'package:e_market/features/auth/presentation/views/signup_view.dart';
import 'package:e_market/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kForgotPasswordView = '/forgotPasswordView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginView()),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
