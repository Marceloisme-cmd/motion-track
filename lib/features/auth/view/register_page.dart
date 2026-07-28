import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motiontrack/core/routes/app_routes.dart';
import 'package:motiontrack/features/auth/widgets/auth_footer.dart';
import 'package:motiontrack/features/auth/widgets/auth_text_field.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/auth_button.dart';
import '../widgets/social_login_button.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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

              AuthTextField(
                label: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap',
                prefixIcon: Icons.person_outline,
                controller: nameController,
              ),

              AuthTextField(
                label: 'Email',
                hintText: 'Masukkan email',
                prefixIcon: Icons.attach_email_outlined,
                controller: emailController,
              ),

              AuthTextField(
                label: 'Password',
                hintText: 'Masukkan Password',
                prefixIcon: Icons.lock_clock_outlined,
                obscureText: true,
                controller: passwordController,
              ),

              const Gap(4),

              AuthTextField(
                label: 'Konfirmasi Password',
                hintText: 'Masukkan kembali password',
                prefixIcon: Icons.lock_clock_outlined,
                obscureText: true,
                controller: confirmPasswordController,
              ),

              const Gap(24),

              AuthButton(
                text: 'Daftar',
                isLoading: isLoading,
                onPressed: () async {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password do not match')),
                    );
                    return;
                  }
                  await ref
                      .read(authProvider.notifier)
                      .register(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );
                },
              ),

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
