import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          fillColor: Color(0xFFF0F0F0),
          filled: true,
          hintText: 'Find Wallpaper..',
          hintStyle: TextStyle(
            color: const Color(0xFFB6B6B6),
            fontSize: 14,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400,
          ),
          suffix: SizedBox(
            width: 20,
            height: 20,
            child: Center(child: SvgPicture.asset(Assets.iconSearch)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(98),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
