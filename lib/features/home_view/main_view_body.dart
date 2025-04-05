import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/category_view/presentation/view/category_view.dart';
import 'package:wallpaper_app/features/favorite_view/presentation/favorite_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/home_view.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/settings_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        CategoryView(),
        FavoriteView(),
        SettingsView(),
      ],
    );
  }
}
