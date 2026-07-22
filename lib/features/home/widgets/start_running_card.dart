import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';

class StartRunningCard extends StatelessWidget {
  const StartRunningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.directions_run_rounded,
                color: Colors.white,
                size: 30,
              ),
              const Spacer(),

              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.lg),

          Text(
            "Start Running",
            style: AppTextStyle.heading2.copyWith(color: Colors.white),
          ),

          const Gap(AppSpacing.sm),

          Text(
            "Track your run and achieve your goals.",
            style: AppTextStyle.body.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
