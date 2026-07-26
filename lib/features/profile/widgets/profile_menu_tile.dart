import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),

      title: Text(title),

      subtitle: subtitle != null ? Text(subtitle!) : null,

      trailing: trailing ?? const Icon(Icons.chevron_right),

      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
    );
  }
}
