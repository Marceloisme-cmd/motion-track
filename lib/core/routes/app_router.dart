import 'package:go_router/go_router.dart';
import 'package:motiontrack/features/auth/view/register_page.dart';

import '../../features/auth/view/login_page.dart';
import '../../features/splash/view/splash_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: AppRoutes.register,
      name: 'Register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
