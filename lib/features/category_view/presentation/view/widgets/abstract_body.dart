import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/widgets/custom_nav_bar.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_feed.dart';

class AbstractViewBody extends StatefulWidget {
  const AbstractViewBody({super.key});

  @override
  State<AbstractViewBody> createState() => _AbstractViewBodyState();
}

class _AbstractViewBodyState extends State<AbstractViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 12),
          CustomNavBar(
            title: "Abstract",
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(height: 12),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [WallpaperFeed()],
            ),
          ),
        ],
      ),
    );
  }
}
