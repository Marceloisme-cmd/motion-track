import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/core/routes/app_routes.dart';
import 'package:motiontrack/features/auth/widgets/auth_footer.dart';
import 'package:motiontrack/features/auth/widgets/or_divider.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Gap(40),

              const Icon(Icons.directions_run_rounded, size: 80),

              const Gap(20),

              Text(
                'MotionTrack',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const Gap(AppSpacing.xs),

              Text(
                'Selamat Datang Kembali',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const Gap(8),

              Text(
                'Masuk untuk melanjutkan perjalanan \nolahragamu bersama MotionTrack.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const Gap(8),

              const AuthTextField(
                label: 'Email',
                hintText: 'Masukkan email',
                prefixIcon: Icons.email_outlined,
                obscureText: false,
              ),

              const Gap(32),

              const AuthTextField(
                label: 'Password',
                hintText: 'Masukkan password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ),

              const Gap(16),

              AuthButton(
                text: 'Masuk',
                onPressed: () {
                  context.go(AppRoutes.home);
                },
              ),

              const Gap(24),

              const OrDivider(),

              const Gap(24),

              SocialLoginButton(text: 'Lanjut dengan Google', onPressed: () {}),

              const Gap(24),

              AuthFooter(
                question: 'Belum punya akun?',
                actionText: 'Daftar',
                onTap: () {
                  context.go(AppRoutes.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
