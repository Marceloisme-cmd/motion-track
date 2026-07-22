import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class MotionTrackApp extends StatelessWidget {
  const MotionTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MotionTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),
      // router
    );
  }
}
