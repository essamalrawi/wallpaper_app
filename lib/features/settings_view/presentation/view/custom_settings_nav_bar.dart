import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class CustomSettingsNavBar extends StatelessWidget {
  const CustomSettingsNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.iconBackwardButton,
            width: 35,
            height: 35,
          ),
        ),
        Spacer(),
        Text(
          "Settings",
          style: TextStyle(
            fontFamily: "SF",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Visibility(
          visible: false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.iconBackwardButton,
              width: 35,
              height: 35,
            ),
          ),
        ),
      ],
    );
  }
}
