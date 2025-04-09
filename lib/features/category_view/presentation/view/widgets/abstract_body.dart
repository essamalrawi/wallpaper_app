import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/widgets/custom_nav_bar.dart';
import 'package:wallpaper_app/core/widgets/wallpaper_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

class AbstractViewBody extends StatefulWidget {
  const AbstractViewBody({super.key});

  @override
  State<AbstractViewBody> createState() => _AbstractViewBodyState();
}

class _AbstractViewBodyState extends State<AbstractViewBody> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked:
          (didPop) => context.read<WallpapersCubit>().fetchWallpapers(
            1,
            KTopic.getRandomWallpaper(),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  CustomNavBar(
                    title: "Abstract",
                    onPressed: () {
                      Navigator.pop(context);
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
            WallpaperFeed(
              showHeartWidget: false,
              wallpapers: context.watch<WallpapersCubit>().wallpapers,
            ),
          ],
        ),
      ),
    );
  }
}
