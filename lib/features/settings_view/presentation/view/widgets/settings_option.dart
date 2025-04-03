import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          SvgPicture.asset(image, width: 52, height: 52),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(
              fontFamily: "SF",
              fontSize: 20,
              color: Color(0xff222222),
            ),
          ),

          Spacer(),

          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              width: 18,
              height: 18,
              Assets.iconSettingsViewIconsArrow,
            ),
          ),
        ],
      ),
    );
  }
}
