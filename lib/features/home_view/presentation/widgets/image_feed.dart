import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class ImageFeed extends StatelessWidget {
  const ImageFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/test.png'),

        Positioned(
          bottom: 4,
          left: 4,
          child: Container(
            width: 45,
            height: 45,
            decoration: ShapeDecoration(
              color: const Color(0x87191E31),
              shape: OvalBorder(),
            ),
            child: Center(
              child: SvgPicture.asset(
                width: 25.07,
                height: 25.07,
                Assets.iconHeart,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
