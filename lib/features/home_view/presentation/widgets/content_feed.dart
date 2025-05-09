import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/data/Entities/content_feed_entity.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/active_content_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/unactive_content_feed.dart';

class ContentFeed extends StatefulWidget {
  const ContentFeed({super.key});

  @override
  State<ContentFeed> createState() => _ContentFeedState();
}

class _ContentFeedState extends State<ContentFeed> {
  int selectedIndex = 0;
  double opactiy = 1;
  AlignmentGeometry alignment = Alignment.bottomLeft;
  static List titles = ["Trending", "Recent", "New"];

  static List unactimages = [
    Assets.imagesUnactiveContentFeedFire,
    Assets.imagesUnactiveContentFeedTimer,
    Assets.imagesUnactiveContentFeedLeaf,
  ];
  static List actimages = [
    Assets.imagesActiveContentFeedFire,
    Assets.imagesActiveContentFeedTimer,
    Assets.imagesActiveContentFeedLeaf,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: ShapeDecoration(
        color: const Color(0xFFE0F3FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UnActiveContentFeed(
                  onTap: () {
                    setState(() {
                      alignment = Alignment.bottomLeft;
                      opactiy = 0;
                    });
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        selectedIndex = 0;
                        opactiy = 1;
                        if (context.read<WallpapersCubit>().switcher != 0) {
                          context.read<WallpapersCubit>().switcher = 0;
                          context.read<WallpapersCubit>().fetchWallpapers(
                            1,
                            KTopic.getRandomWallpaper(),
                          );
                        }
                      });
                    });
                  },
                  entity: ContentFeedEntity(
                    title: titles[0],
                    image: unactimages[0],
                  ),
                ),
                UnActiveContentFeed(
                  onTap: () {
                    setState(() {
                      alignment = Alignment.center;
                      opactiy = 0;
                    });
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        selectedIndex = 1;
                        opactiy = 1;
                        if (context.read<WallpapersCubit>().switcher != 1) {
                          context.read<WallpapersCubit>().switcher = 1;
                          context.read<WallpapersCubit>().fetchWallpapers(
                            2,
                            KTopic.getRandomWallpaper(),
                          );
                        }
                      });
                    });
                  },
                  entity: ContentFeedEntity(
                    title: titles[1],
                    image: unactimages[1],
                  ),
                ),
                UnActiveContentFeed(
                  onTap: () {
                    setState(() {
                      alignment = Alignment.bottomRight;
                      opactiy = 0;
                    });
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        opactiy = 1;
                        selectedIndex = 2;
                        if (context.read<WallpapersCubit>().switcher != 2) {
                          context.read<WallpapersCubit>().switcher = 2;
                          context.read<WallpapersCubit>().fetchWallpapers(
                            3,
                            KTopic.getRandomWallpaper(),
                          );
                        }
                      });
                    });
                  },
                  entity: ContentFeedEntity(
                    title: titles[2],
                    image: unactimages[2],
                  ),
                ),
              ],
            ),

            AnimatedAlign(
              alignment: alignment,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,

              child: IgnorePointer(
                ignoring: true,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 350),
                  opacity: 1,
                  child: ActiveContentFeed(
                    entity: ContentFeedEntity(
                      title: titles[selectedIndex],
                      image: actimages[selectedIndex],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
