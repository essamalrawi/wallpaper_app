import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_blur_image.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

class WallpaperViewBody extends StatelessWidget {
  const WallpaperViewBody({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return WallpaperBlurImage(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    Assets.iconBackwardButton,
                    color: Colors.white,
                    width: 35,
                    height: 35,
                  ),
                ),
              ],
            ),
            Spacer(),
            ImageWallpaperFeed(image: image),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class ImageWallpaperFeed extends StatelessWidget {
  const ImageWallpaperFeed({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),

      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .87,

        child: CachedNetworkImage(
          imageUrl: context.read<WallpapersCubit>().selectedImage,
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
      ),
    );
  }
}
