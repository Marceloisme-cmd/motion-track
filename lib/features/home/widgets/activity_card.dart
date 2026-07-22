import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../models/run_activity.dart';
import 'activity_metric.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity, this.onTap});

  final RunActivity activity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.card),
        onTap: onTap,
        child: Container(
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
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,

                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_run_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(AppSpacing.md),

                  Expanded(
                    child: Text(
                      activity.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                ],
              ),

              const Gap(AppSpacing.md),

              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),

                  const Gap(AppSpacing.xs),

                  Expanded(
                    child: Text(
                      activity.location,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(AppSpacing.md),

              Divider(color: Colors.grey.shade200),

              const Gap(AppSpacing.md),

              Row(
                children: [
                  ActivityMetric(
                    icon: Icons.straighten,
                    value: "${activity.distance} km",
                    label: "Distance",
                    iconColor: Colors.blue,
                  ),

                  ActivityMetric(
                    icon: Icons.timer_outlined,
                    value: "${activity.duration.inMinutes} min",
                    label: "Duration",
                    iconColor: Colors.green,
                  ),

                  ActivityMetric(
                    icon: Icons.speed_rounded,
                    value: activity.pace,
                    label: "pace",
                    iconColor: Colors.orange,
                  ),
                ],
              ),
              const Gap(AppSpacing.lg),

              Divider(color: Colors.grey.shade200),

              const Gap(AppSpacing.md),

              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: AppColors.primary,
                  ),

                  const Gap(AppSpacing.xs),

                  Text(
                    "${activity.date.day}/${activity.date.month}/${activity.date.year}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "View Details",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Gap(4),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
