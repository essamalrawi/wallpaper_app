import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class ImageFeed extends StatelessWidget {
  const ImageFeed({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          placeholder:
              (context, url) => Center(
                child: Image.asset(
                  width: 100,
                  height: 100,
                  "assets/images/loading.gif",
                ),
              ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

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
