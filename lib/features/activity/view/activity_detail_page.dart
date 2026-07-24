import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motiontrack/features/home/models/run_activity.dart';
import '../../../core/theme/app_spacing.dart';
import '../widgets/activity_stat_tile.dart';
import '../widgets/activity_info_section.dart';
import '../widgets/activity_route_card.dart';
import '../widgets/activity_notes_card.dart';

class ActivityDetailPage extends StatelessWidget {
  const ActivityDetailPage({super.key, required this.activity});
  final RunActivity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(activity.title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityInfoSection(activity: activity),

              const Gap(AppSpacing.xl),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.15,
                children: [
                  ActivityStatTile(
                    title: 'Distance',
                    value: '${activity.distance} km',
                    icon: Icons.straighten,
                  ),

                  ActivityStatTile(
                    title: 'Duration',
                    value: '${activity.duration.inMinutes} min',
                    icon: Icons.timer_outlined,
                  ),

                  ActivityStatTile(
                    title: 'Average Pace',
                    value: activity.pace,
                    icon: Icons.speed,
                  ),

                  const ActivityStatTile(
                    title: 'Calories',
                    value: '430 kcal',
                    icon: Icons.local_fire_department,
                  ),
                ],
              ),
              const Gap(AppSpacing.xl),

              const ActivityRouteCard(),

              const Gap(AppSpacing.xl),

              ActivityNotesCard(notes: activity.notes),

              const Gap(AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
