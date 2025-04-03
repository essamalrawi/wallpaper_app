import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/core/utils/app_text_styles.dart';

class SettingFotterSection extends StatelessWidget {
  const SettingFotterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 52;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              width: width,
              height: width,
              Assets.iconSettingsViewIconsInstgram,
            ),
            SizedBox(width: 20),
            SvgPicture.asset(
              width: width,
              height: width,
              Assets.iconSettingsViewIconsFacebook,
            ),
            SizedBox(width: 20),
            SvgPicture.asset(
              width: width,
              height: width,
              Assets.iconSettingsViewIconsTwitter,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Like & Follow us on",
          style: TextStyles.light32.copyWith(
            fontFamily: "SF",
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
