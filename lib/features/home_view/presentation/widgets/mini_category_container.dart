import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/features/category_view/data/image_category_model.dart';
import 'package:wallpaper_app/features/category_view/presentation/abstract_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';

class MiniCategoryContainer extends StatelessWidget {
  const MiniCategoryContainer({super.key});

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
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<FetchWallpapersCubit>(
                          context,
                        ).fetchWallpapersForCategory(
                          index,
                          images[index].topic,
                        );
                        Navigator.pushNamed(context, AbstractView.routeName);
                      },

                      child: Image.asset(images[index].imagePath),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
