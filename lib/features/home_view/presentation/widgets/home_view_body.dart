import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/content_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_app_bar.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_slider.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/mini_category_container.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/showSearchOverlay.dart';

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
                SizedBox(height: 12),
                GestureDetector(
                  child: CustomAppBar(),
                  onTap: () => showSearchOverlay(context: context),
                ),
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
          WallpaperFeed(
            showHeartWidget: true,
            wallpapers: context.watch<WallpapersCubit>().wallpapers,
          ),
        ],
      ),
    );
  }
}
