import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.primary.withValues(alpha: 0.15),
        child: Text(
          "MD",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
