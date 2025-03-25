import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/features/home_view/data/Entity/content_feed_entity.dart';

class ActiveContentFeed extends StatelessWidget {
  const ActiveContentFeed({super.key, required this.entity});
  final ContentFeedEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width - 16) * (0.9 / 3),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.15, -0.64),
          end: Alignment(1.45, 1.65),
          colors: [const Color(0xFF6747E7), const Color(0xFF00FFEF)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
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
              color: Colors.white,
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
