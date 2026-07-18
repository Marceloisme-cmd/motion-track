import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),

              //logo
              const Icon(Icons.directions_run, color: Colors.white, size: 90),

              const Gap(24),

              //Nama Aplikasi
              Text(
                'MotionTrack',
                style: AppTextStyle.heading1.copyWith(color: Colors.white),
              ),

              const Gap(8),

              //tagline
              Text(
                'Pantau setiap langkah.\nCapai setiap tujuan.',
                style: AppTextStyle.body.copyWith(color: Colors.white70),
              ),

              const Spacer(),

              //loading
              const CircularProgressIndicator(color: Colors.white),

              const Gap(16),

              Text(
                "version 1.0.0",
                style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
              ),

              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
