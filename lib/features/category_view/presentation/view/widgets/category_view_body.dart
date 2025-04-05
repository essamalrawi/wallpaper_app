import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/widgets/custom_nav_bar.dart';
import 'package:wallpaper_app/features/category_view/data/image_category_model.dart';
import 'package:wallpaper_app/features/category_view/presentation/abstract_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 12),

          CustomNavBar(title: "Category"),
          SizedBox(height: 12),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                childAspectRatio: 100 / 90,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<FetchWallpapersCubit>(
                      context,
                    ).fetchWallpapersForCategory(index, images[index].topic);
                    Navigator.pushNamed(context, AbstractView.routeName);
                  },

                  child: Image.asset(images[index].imagePath),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
