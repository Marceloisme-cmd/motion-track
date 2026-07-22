import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/features/home/widgets/recent_activity_section.dart';
import '../widgets/greeting_section.dart';
import '../widgets/start_running_card.dart';
import '../widgets/today_stats_section.dart';
import '../widgets/weekly_goal_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsetsGeometry.all(AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingSection(useurname: 'Marcelo'),

                const Gap(AppSpacing.section),

                const StartRunningCard(),

                const Gap(AppSpacing.section),

                const TodayStatsSection(),
                const Gap(AppSpacing.section),

                const WeeklyGoalCard(currentDistance: 20, targetDistance: 30),

                const Gap(AppSpacing.section),

                const RecentActivitySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
