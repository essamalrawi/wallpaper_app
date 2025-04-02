import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/image_feed.dart';

class WallpaperFeed extends StatelessWidget {
  const WallpaperFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWallpapersCubit, FetchWallpapersState>(
      builder: (context, state) {
        final wallpapers = context.watch<FetchWallpapersCubit>().wallpapers;
        if (state is FetchWallpapersLoading) {
          return SliverToBoxAdapter(
            child: Lottie.asset("assets/lottie/loading.json"),
          );
        } else if (state is FetchWallpapersSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.only(bottom: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageFeed(image: wallpapers[index].image.toString()),
                );
              }, childCount: wallpapers.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 14,
                childAspectRatio: 9 / 16,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Lottie.asset("assets/lottie/empty.json"),
          );
        }
      },
    );
  }
}
