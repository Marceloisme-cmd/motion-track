import 'package:go_router/go_router.dart';
import 'package:motiontrack/features/activity/view/activity_detail_page.dart';
import 'package:motiontrack/features/auth/view/register_page.dart';
import 'package:motiontrack/features/home/models/run_activity.dart';
import 'package:motiontrack/features/navigation/view/main_navigation_page.dart';
import '../../providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/view/login_page.dart';
import '../../features/splash/view/splash_page.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,

    redirect: (context, state) {
      final user = authState.value;

      final isAuthPage =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register;

      if (user == null) {
        return isAuthPage ? null : AppRoutes.login;
      }
      if (isAuthPage) {
        return AppRoutes.home;
      }
      return null;
    },

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
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainNavigationPage(),
      ),
      GoRoute(
        path: AppRoutes.activityDetail,
        name: 'activityDetail',
        builder: (context, state) {
          final activity = state.extra as RunActivity;

          return ActivityDetailPage(activity: activity);
        },
      ),
    ],
  );
});
