import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/custom_settings_nav_bar.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/widgets/settings_option.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/widgets/settings_option_with_switch.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 12),

          CustomSettingsNavBar(),
          SizedBox(height: 35),
          SettingsBodySection(),
        ],
      ),
    );
  }
}

class SettingsBodySection extends StatelessWidget {
  const SettingsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeBoxHeight = 10;
    double indent = 55;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SettingsOptionWithSwitch(
              text: 'Push notifications',
              image: Assets.iconSettingsViewIconsSettingsNotifcations,
            ),

            Divider(indent: indent),
            SizedBox(height: sizeBoxHeight),

            SettingsOption(
              text: 'Invite a friend',
              image: Assets.iconSettingsViewIconsSettingsInvite,
            ),
            Divider(indent: indent),
            SizedBox(height: sizeBoxHeight),
            SettingsOption(
              text: 'Rate this app',
              image: Assets.iconSettingsViewIconsSettingsStar,
            ),
            Divider(indent: indent),
            SizedBox(height: sizeBoxHeight),
            SettingsOption(
              text: 'Feedback & bugs',
              image: Assets.iconSettingsViewIconsSettingsFeedback,
            ),
            Divider(indent: indent),
            SizedBox(height: sizeBoxHeight),
            SettingsOption(
              text: 'Terms & Conditions',
              image: Assets.iconSettingsViewIconsSettingsTerms,
            ),
            Divider(indent: indent),
            SizedBox(height: sizeBoxHeight),

            SettingsOption(
              text: 'Privacy Policy',
              image: Assets.iconSettingsViewIconsSettingsPrivacy,
            ),
          ],
        ),
      ),
    );
  }
}
