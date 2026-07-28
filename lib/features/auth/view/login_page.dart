import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/core/routes/app_routes.dart';
import 'package:motiontrack/features/auth/widgets/auth_footer.dart';
import 'package:motiontrack/features/auth/widgets/or_divider.dart';
import 'package:motiontrack/providers/auth_provider.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/social_login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

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

              AuthTextField(
                label: 'Email',
                hintText: 'Masukkan email',
                prefixIcon: Icons.email_outlined,
                obscureText: false,
                controller: emailController,
              ),

              const Gap(32),

              AuthTextField(
                label: 'Password',
                hintText: 'Masukkan password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                controller: passwordController,
              ),

              const Gap(16),

              AuthButton(
                text: 'Masuk',
                isLoading: isLoading,
                onPressed: () async {
                  if (emailController.text.trim().isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Yuk, isi email dan password dulu"),
                      ),
                    );
                    return;
                  }
                  try {
                    await ref
                        .read(authProvider.notifier)
                        .login(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        );

                    if (context.mounted) {
                      context.go(AppRoutes.home);
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ups! Email atau password belum cocok"),
                        ),
                      );
                    }
                  }
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
