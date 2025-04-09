import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_text_field.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField(enabled: false)),
        const SizedBox(width: 5),
        SvgPicture.asset(Assets.iconNotification, width: 33, height: 33),
      ],
    );
  }
}
