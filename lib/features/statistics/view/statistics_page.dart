import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/features/statistics/widgets/monthly_progress_card.dart';
import 'package:motiontrack/features/statistics/widgets/statistics_summary_grid.dart';
import 'package:motiontrack/features/statistics/widgets/weekly_distance_chart.dart';
import '../widgets/personal_best_card.dart';
import '../widgets/statistics_header.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            StatisticsHeader(),
            const Gap(AppSpacing.xl),

            const StatisticsSummaryGrid(),

            const Gap(AppSpacing.xl),

            const WeeklyDistanceChart(),

            const Gap(AppSpacing.xl),

            const PersonalBestCard(),

            const Gap(AppSpacing.xl),

            const MonthlyProgressCard(),
          ],
        ),
      ),
    );
  }
}
