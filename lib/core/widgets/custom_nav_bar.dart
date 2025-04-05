import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            Assets.iconBackwardButton,
            width: 35,
            height: 35,
          ),
        ),
        Spacer(),
        Text(
          title,
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
