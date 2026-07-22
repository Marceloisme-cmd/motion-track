import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import 'stats_card.dart';

class TodayStatsSection extends StatelessWidget {
  const TodayStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Today's Stats", style: Theme.of(context).textTheme.titleLarge),

        const Gap(AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: StatsCard(
                icon: Icons.straighten,
                value: "5.2 km",
                title: "Distance",
                iconBackgroundColor: AppColors.primary,
              ),
            ),

            const Gap(AppSpacing.md),

            Expanded(
              child: StatsCard(
                icon: Icons.timer_outlined,
                value: "32 min",
                title: "Duration",
                iconBackgroundColor: Colors.blue,
              ),
            ),
          ],
        ),

        const Gap(AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: StatsCard(
                icon: Icons.speed,
                value: "6'12\"",
                title: "Avg Pace",
                iconBackgroundColor: Colors.orange,
              ),
            ),

            const Gap(AppSpacing.md),

            Expanded(
              child: StatsCard(
                icon: Icons.local_fire_department_outlined,
                value: "430 Kal",
                title: "Calories",
                iconBackgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
