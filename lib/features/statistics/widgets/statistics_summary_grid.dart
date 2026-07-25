import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import 'statistics_summary_card.dart';

class StatisticsSummaryGrid extends StatelessWidget {
  const StatisticsSummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.3,
      children: const [
        StatisticsSummaryCard(title: 'Total Distance', value: '152.8 km'),

        StatisticsSummaryCard(title: 'Total Runs', value: '28'),

        StatisticsSummaryCard(title: 'Total Duration', value: '14h 25m'),

        StatisticsSummaryCard(title: 'Average Pace', value: "6'15\"/km"),
      ],
    );
  }
}
