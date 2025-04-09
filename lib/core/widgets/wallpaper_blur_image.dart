import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

class WallpaperBlurImage extends StatelessWidget {
  const WallpaperBlurImage({
    super.key,
    required this.widget,
    required this.image,
  });

  final Widget widget;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
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

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
          child: Container(color: Colors.black.withOpacity(0.2)),
        ),

        SafeArea(child: widget),
      ],
    );
  }
}
