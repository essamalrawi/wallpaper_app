import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class MiniCategoryContainer extends StatelessWidget {
  const MiniCategoryContainer({super.key});
  static List images = [
    Assets.imagesCategories1,
    Assets.imagesCategories2,
    Assets.imagesCategories3,
    Assets.imagesCategories4,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Category ',
              style: TextStyle(
                fontFamily: "poppins",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'View All',
              style: TextStyle(
                color: const Color(0xFF0071E3),
                fontSize: 18,
                fontFamily: 'SF',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: (MediaQuery.sizeOf(context).width - 16) * (0.9 / 4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: (MediaQuery.sizeOf(context).width - 16) * (0.9 / 4),
                    child: Image.asset(images[index]),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
