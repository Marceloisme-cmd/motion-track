import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';
import '../../../core/routes/app_routes.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/features/activity/widgets/activity_list_info.dart';
import 'package:motiontrack/features/home/widgets/activity_card.dart';

import '../widgets/activity_header.dart';
import '../widgets/activity_search_bar.dart';
import '../../home/data/dummy_data.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ActivityHeader(),
              Gap(AppSpacing.screenPadding),

              const ActivitySearchBar(),
              Gap(AppSpacing.screenPadding),
              ActivityListInfo(totalActivities: dummyActivities.length),
              Gap(AppSpacing.screenPadding),

              ...dummyActivities.map(
                (activity) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: ActivityCard(
                    activity: activity,
                    onTap: () {
                      context.push(AppRoutes.activityDetail, extra: activity);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
