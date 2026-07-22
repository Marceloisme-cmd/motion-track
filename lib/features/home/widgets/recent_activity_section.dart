import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_spacing.dart';
import '../data/dummy_data.dart';
import 'activity_card.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Activity", style: Theme.of(context).textTheme.titleLarge),

        const Gap(AppSpacing.md),

        ...dummyActivities.map(
          (activity) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: ActivityCard(activity: activity),
          ),
        ),
      ],
    );
  }
}
