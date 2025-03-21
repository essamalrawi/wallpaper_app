import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextField(),
        SizedBox(width: 5),
        SvgPicture.asset(width: 33, height: 33, Assets.iconNotification),
      ],
    );
  }
}
