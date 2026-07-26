import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motiontrack/core/theme/app_spacing.dart';
import 'package:motiontrack/features/profile/widgets/logout_button.dart';
import 'package:motiontrack/features/profile/widgets/profile_avatar.dart';
import 'package:motiontrack/features/profile/widgets/profile_header.dart';
import 'package:motiontrack/features/profile/widgets/profile_menu_tile.dart';
import 'package:motiontrack/features/profile/widgets/profile_section_card.dart';
import 'package:motiontrack/features/profile/widgets/profile_section_title.dart';
import 'package:motiontrack/features/profile/widgets/profile_user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ProfileHeader(),

          SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 180),
                  const ProfileAvatar(),

                  const ProfileUserInfo(
                    name: "Marcelo",
                    subtitle: "Running Enthusiast",
                  ),

                  const Gap(AppSpacing.xl),

                  const ProfileSectionTitle(title: "Personal Information"),

                  const Gap(AppSpacing.md),

                  const ProfileSectionCard(
                    children: [
                      ProfileMenuTile(
                        icon: Icons.email_outlined,
                        title: "Email",
                        subtitle: "marcelo@gmail.com",
                        trailing: SizedBox.shrink(),
                      ),

                      Divider(),

                      ProfileMenuTile(
                        icon: Icons.height,
                        title: "Height",
                        subtitle: "170 cm",
                        trailing: SizedBox.shrink(),
                      ),

                      Divider(),

                      ProfileMenuTile(
                        icon: Icons.monitor_weight_outlined,
                        title: "Weight",
                        subtitle: "65 kg",
                        trailing: SizedBox.shrink(),
                      ),
                    ],
                  ),

                  const Gap(AppSpacing.xl),

                  const ProfileSectionTitle(title: "Running Goals"),
                  const Gap(AppSpacing.md),

                  const ProfileSectionCard(
                    children: [
                      ProfileMenuTile(
                        icon: Icons.flag_outlined,
                        title: "Weekly Goal",
                        subtitle: "20 km",
                        trailing: SizedBox.shrink(),
                      ),

                      Divider(),

                      ProfileMenuTile(
                        icon: Icons.emoji_events_outlined,
                        title: "Monthly Goal",
                        subtitle: "80 km",
                        trailing: SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const Gap(AppSpacing.xl),

                  const ProfileSectionTitle(title: "About"),

                  const Gap(AppSpacing.md),

                  ProfileSectionCard(
                    children: [
                      ProfileMenuTile(
                        icon: Icons.info_outline,
                        title: "About MotionTrack",
                        onTap: () {},
                      ),
                      const Divider(),

                      ProfileMenuTile(
                        icon: Icons.privacy_tip_outlined,
                        title: "Privacy Policy",
                        onTap: () {},
                      ),

                      const Divider(),
                      ProfileMenuTile(
                        icon: Icons.description_outlined,
                        title: "Terms of Service",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Gap(AppSpacing.xl),
                  LogoutButton(onTap: () {}),
                  const Gap(AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
