import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';
import 'package:wallpaper_app/core/views/wallpaper_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/image_feed.dart';

class WallpaperFeed extends StatelessWidget {
  const WallpaperFeed({
    super.key,
    required this.wallpapers,
    required this.showHeartWidget,
  });
  final List<WallpaperModel> wallpapers;
  final bool showHeartWidget;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpapersCubit, WallpapersState>(
      builder: (context, state) {
        if (state is WallpapersLoading) {
          return SliverToBoxAdapter(
            child: Lottie.asset("assets/lottie/loading.json"),
          );
        } else if (state is WallpapersSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.only(bottom: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  WallpaperView(image: wallpapers[index].image),
                        ),
                      );
                      // Navigator.pushNamed(context, WallpaperView.routeName);
                    },
                    child: ImageFeed(
                      showHeartWidget: showHeartWidget,
                      image: wallpapers[index].image,
                    ),
                  ),
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
