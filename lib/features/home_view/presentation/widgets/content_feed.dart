import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/home_view/data/Entity/content_feed_entity.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/active_content_feed.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/unactive_content_feed.dart';

class ContentFeed extends StatefulWidget {
  const ContentFeed({super.key});

  @override
  State<ContentFeed> createState() => _ContentFeedState();
}

class _ContentFeedState extends State<ContentFeed> {
  int selectedIndex = 0;
  int oldSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: ShapeDecoration(
        color: const Color(0xFFE0F3FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchBetweenContentFeed(
              onTap: () {
                oldSelectedIndex = selectedIndex;
                selectedIndex = 0;
                setState(() {});
              },

              index: 0,
              selectedIndex: selectedIndex,
            ),
            SwitchBetweenContentFeed(
              onTap: () {
                oldSelectedIndex = selectedIndex;
                selectedIndex = 1;
                setState(() {});
              },

              index: 1,
              selectedIndex: selectedIndex,
            ),
            SwitchBetweenContentFeed(
              onTap: () {
                oldSelectedIndex = selectedIndex;
                selectedIndex = 2;
                setState(() {});
              },

              index: 2,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchBetweenContentFeed extends StatefulWidget {
  const SwitchBetweenContentFeed({
    super.key,
    required this.index,
    required this.selectedIndex,
    this.onTap,
  });
  final int index;
  final int selectedIndex;
  final void Function()? onTap;

  static List titles = ["Trending", "Recent", "New"];

  static List actimages = [
    Assets.imagesActiveContentFeedFire,
    Assets.imagesActiveContentFeedTimer,
    Assets.imagesActiveContentFeedLeaf,
  ];
  static List unactimages = [
    Assets.imagesUnactiveContentFeedFire,
    Assets.imagesUnactiveContentFeedTimer,
    Assets.imagesUnactiveContentFeedLeaf,
  ];

  @override
  State<SwitchBetweenContentFeed> createState() =>
      _SwitchBetweenContentFeedState();
}

class _SwitchBetweenContentFeedState extends State<SwitchBetweenContentFeed> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,

      child:
          widget.index == widget.selectedIndex
              ? ActiveContentFeed(
                entity: ContentFeedEntity(
                  title: SwitchBetweenContentFeed.titles[widget.index],
                  image: SwitchBetweenContentFeed.actimages[widget.index],
                ),
              )
              : UnActiveContentFeed(
                entity: ContentFeedEntity(
                  title: SwitchBetweenContentFeed.titles[widget.index],
                  image: SwitchBetweenContentFeed.unactimages[widget.index],
                ),
              ),
    );
  }
}
