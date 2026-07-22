import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

class WeeklyGoalCard extends StatelessWidget {
  const WeeklyGoalCard({
    super.key,
    required this.currentDistance,
    required this.targetDistance,
  });

  final double currentDistance;
  final double targetDistance;

  @override
  Widget build(BuildContext context) {
    final progress = currentDistance / targetDistance;
    final remaining = targetDistance - currentDistance;
    final percentage = (progress * 100).round();

    final bool isCompleted = currentDistance >= targetDistance;

    final String message = isCompleted
        ? "🏆 Goal Completed"
        : " Tinggal ${remaining.toStringAsFixed(1)} km lagi";

    return Container(
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
              const Icon(Icons.flag_rounded, color: Colors.orange),

              const Gap(AppSpacing.sm),

              Text(
                "Weekly Goal",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const Spacer(),

              Text(
                "$percentage%",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const Gap(AppSpacing.lg),

          Text(
            "${currentDistance.toStringAsFixed(1)} / ${targetDistance.toStringAsFixed((0))} km",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: AppSpacing.md),

          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 1200),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation(
                    isCompleted ? Colors.green : AppColors.primary,
                  ),
                );
              },
            ),
          ),

          const Gap(AppSpacing.md),

          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isCompleted ? Colors.green : AppColors.primary,
            ),
          ),

          Text(
            isCompleted
                ? "Amazing! Keep your consistency 🚀"
                : "Keep going. you're almost theme!",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
