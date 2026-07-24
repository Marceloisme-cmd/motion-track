import 'package:flutter/material.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import '../widgets/statistics_header.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [StatisticsHeader()],
        ),
      ),
    );
  }
}
