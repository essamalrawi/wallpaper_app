import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/features/home_view/data/Entity/content_feed_entity.dart';

class UnActiveContentFeed extends StatelessWidget {
  const UnActiveContentFeed({super.key, required this.entity});
  final ContentFeedEntity entity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 16) * (0.9 / 3),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          SvgPicture.asset(entity.image, width: 26),
          Spacer(),
          Text(
            entity.title,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'SF',
              fontWeight: FontWeight.w400,
              color: Color(0xFF6747E7),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
