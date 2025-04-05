import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/features/home_view/main_view_body.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_button_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          if (index == 0) {
            context.read<FetchWallpapersCubit>().fetchWallpapers(
              1,
              KTopic.getRandomWallpaper(),
            );
          }

          setState(() {});
        },
      ),
      body: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
