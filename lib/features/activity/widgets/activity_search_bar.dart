import 'package:flutter/material.dart';
import 'package:motiontrack/features/activity/widgets/activity_filter_sheet.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key, this.onChanged, this.onFilterTap});

  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search activities...',
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              builder: (_) => const ActivityFilterSheet(),
            );
          },
          icon: const Icon(Icons.tune_rounded, color: AppColors.primary),
        ),
        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
