import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/image_feed.dart';

class WallpaperFeed extends StatelessWidget {
  const WallpaperFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageFeed(),
          );
        }, childCount: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 14,
          childAspectRatio: 9 / 16,
        ),
      ),
    );
  }
}
