import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key, required this.useurname});

  final String useurname;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang 👋',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        const Gap(4),

        Text(useurname, style: Theme.of(context).textTheme.headlineMedium),

        const Gap(8),

        Text(
          'Siap mencatat aktivitas mu hari ini?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
