import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class SettingsOptionWithSwitch extends StatefulWidget {
  const SettingsOptionWithSwitch({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  State<SettingsOptionWithSwitch> createState() =>
      _SettingsOptionWithSwitchState();
}

class _SettingsOptionWithSwitchState extends State<SettingsOptionWithSwitch> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          SvgPicture.asset(widget.image, width: 52, height: 52),
          SizedBox(width: 16),
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: "SF",
              fontSize: 20,
              color: Color(0xff222222),
            ),
          ),

          Spacer(),

          IconButton(
            onPressed: () {
              clicked = !clicked;
              setState(() {});
            },
            icon: SvgPicture.asset(
              width: 30,
              height: 30,
              clicked
                  ? Assets.iconSettingsViewIconsSetttingsOn
                  : Assets.iconSettingsViewIconsSettingsOff,
            ),
          ),
        ],
      ),
    );
  }
}
