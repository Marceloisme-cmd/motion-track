import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../splash/widgets/auth_text_field.dart';

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

              const Gap(16),

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

              const Gap(32),

              const AuthTextField(
                label: 'Password',
                hintText: 'Masukkan password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
