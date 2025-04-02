import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo.dart';
import 'package:wallpaper_app/core/utils/get_it_service.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create:
              (context) =>
                  FetchWallpapersCubit(getIt<WallpapersRepo>())
                    ..fetchWallpapers(1),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
