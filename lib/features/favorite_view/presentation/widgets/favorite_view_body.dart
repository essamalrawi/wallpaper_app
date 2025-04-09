import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/manager/navigation/navigation_cubit.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';
import 'package:wallpaper_app/core/widgets/custom_nav_bar.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 12),
                CustomNavBar(
                  title: "Favorite",
                  onPressed: () {
                    context.read<NavigationCubit>().changeIndex(0);
                    context.read<WallpapersCubit>().fetchWallpapers(
                      1,
                      KTopic.getRandomWallpaper(),
                    );
                  },
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          context.read<WallpapersCubit>().checkIfFavWallpaperIsNotEmpty()
              ? WallpaperFeed(
                showHeartWidget: false,
                wallpapers: WallpaperModel.fromStrings(
                  context.watch<WallpapersCubit>().wallpapersByFavorite,
                ),
              )
              : SliverFillRemaining(
                child: Center(
                  child: Text(
                    'No favorite found.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFB6B6B6),
                      fontSize: 20,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
