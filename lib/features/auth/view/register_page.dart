import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motiontrack/core/routes/app_routes.dart';
import 'package:motiontrack/features/auth/widgets/auth_footer.dart';
import 'package:motiontrack/features/auth/widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/social_login_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Gap(16),

              const Icon(Icons.directions_run_rounded, size: 80),

              const Gap(20),

              Text(
                'MotionTrack',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const Gap(8),

              Text(
                'Buat akun personal kamu',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const Gap(8),

              const AuthTextField(
                label: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap',
                prefixIcon: Icons.person_outline,
              ),

              const AuthTextField(
                label: 'Email',
                hintText: 'Masukkan email',
                prefixIcon: Icons.attach_email_outlined,
              ),

              const AuthTextField(
                label: 'Password',
                hintText: 'Masukkan Password',
                prefixIcon: Icons.lock_clock_outlined,
                obscureText: true,
              ),

              const Gap(4),

              const AuthTextField(
                label: 'Konfirmasi Password',
                hintText: 'Masukkan kembali password',
                prefixIcon: Icons.lock_clock_outlined,
                obscureText: true,
              ),

              const Gap(24),

              AuthButton(text: 'Daftar', onPressed: () {}),

              const Gap(24),

              SocialLoginButton(text: 'Lanjut dengan Google', onPressed: () {}),

              const Gap(24),

              AuthFooter(
                question: 'Sudah punya akun?',
                actionText: 'Masuk',
                onTap: () {
                  context.go(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
