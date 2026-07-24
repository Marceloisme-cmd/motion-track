import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import '../../../core/theme/app_spacing.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(AppSpacing.sm),

        Text(
          'Your progress, visualed',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
