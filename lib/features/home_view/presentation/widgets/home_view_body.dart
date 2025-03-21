import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';
import 'package:wallpaper_app/core/utils/app_text_styles.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_app_bar.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_slider.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/mini_category_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomAppBar(),
          SizedBox(height: 33 / 2),
          HomeViewSlider(),
          SizedBox(height: 9),

          MiniCategoryContainer(),
        ],
      ),
    );
  }
}
