import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import 'personal_best_tile.dart';

class PersonalBestCard extends StatelessWidget {
  const PersonalBestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Best",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(AppSpacing.lg),

          const PersonalBestTile(
            icon: Icons.route,
            title: "Longest Run",
            value: "18.6 km",
          ),

          const Gap(AppSpacing.lg),

          const PersonalBestTile(
            icon: Icons.speed,
            title: "Best Pace",
            value: "4'35\" /km",
          ),

          const Gap(AppSpacing.lg),

          const PersonalBestTile(
            icon: Icons.timer_outlined,
            title: "Fastest 5k",
            value: "22m 15s",
          ),

          const Gap(AppSpacing.lg),

          const PersonalBestTile(
            icon: Icons.local_fire_department,
            title: "Highest Calories",
            value: "900 kcal",
          ),
        ],
      ),
    );
  }
}
