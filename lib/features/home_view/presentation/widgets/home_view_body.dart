import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/content_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_app_bar.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_slider.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/mini_category_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomAppBar(),
                SizedBox(height: 33 / 2),
                HomeViewSlider(),
                SizedBox(height: 9),

                MiniCategoryContainer(),
                SizedBox(height: 18),
                ContentFeed(),
                SizedBox(height: 21),
              ],
            ),
          ),
          WallpaperFeed(),
        ],
      ),
    );
  }
}

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
