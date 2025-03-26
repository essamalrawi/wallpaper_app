import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),

          decoration: BoxDecoration(
            color: Color(0xffF0F0F0),

            borderRadius: BorderRadius.circular(230),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset(image, width: 30, height: 30)),
              const SizedBox(width: 4),
              Text(text, style: TextStyle(color: AppColors.primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
