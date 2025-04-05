import 'package:flutter/material.dart';

import 'package:wallpaper_app/core/widgets/custom_nav_bar.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/widgets/settings_body_section.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/widgets/settings_fotter_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 12),

            CustomNavBar(title: "Settings"),
            SizedBox(height: 35),
            SettingsBodySection(),
            SizedBox(height: 35),

            SettingFotterSection(),
          ],
        ),
      ),
    );
  }
}
