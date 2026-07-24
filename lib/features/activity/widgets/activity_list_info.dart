import 'package:flutter/material.dart';

class ActivityListInfo extends StatelessWidget {
  const ActivityListInfo({super.key, required this.totalActivities});
  final int totalActivities;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Showing $totalActivities activities',
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
    );
  }
}
