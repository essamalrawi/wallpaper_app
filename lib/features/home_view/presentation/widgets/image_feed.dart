import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

class ImageFeed extends StatefulWidget {
  const ImageFeed({
    super.key,
    required this.image,
    required this.showHeartWidget,
  });
  final String image;
  final bool showHeartWidget;
  @override
  State<ImageFeed> createState() => _ImageFeedState();
}

class _ImageFeedState extends State<ImageFeed> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: widget.image,
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

        !widget.showHeartWidget
            ? SizedBox()
            : Positioned(
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
                  child: GestureDetector(
                    onTap: () {
                      if (context
                          .read<WallpapersCubit>()
                          .checkIfFavWallpaperExist(widget.image)) {
                        context.read<WallpapersCubit>().removeFavoriteWallpaper(
                          widget.image,
                        );
                      } else {
                        context.read<WallpapersCubit>().addFavoriteWallpaper(
                          widget.image,
                        );
                      }
                    },
                    child: SvgPicture.asset(
                      width: 25.07,
                      height: 25.07,

                      context.read<WallpapersCubit>().checkIfFavWallpaperExist(
                            widget.image,
                          )
                          ? Assets.iconFillHeart
                          : Assets.iconHeart,
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
