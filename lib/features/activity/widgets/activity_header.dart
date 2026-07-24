import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_spacing.dart';

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),

        const Gap(AppSpacing.xs),

        Text(
          "Every run tells a story",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
