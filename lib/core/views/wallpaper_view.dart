import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_view_body.dart';

class WallpaperView extends StatelessWidget {
  const WallpaperView({super.key, required this.image});
  final String image;
  static const routeName = "wallpaper_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WallpaperViewBody(image: image));
  }
}
