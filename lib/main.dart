import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/functions/on_generate_route.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo.dart';
import 'package:wallpaper_app/core/utils/custom_bloc_observer.dart';
import 'package:wallpaper_app/core/utils/get_it_service.dart';
import 'package:wallpaper_app/features/home_view/main_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/catch_trending/catch_trending_cubit.dart';
import 'package:wallpaper_app/my_http_overrides.dart';

void main() {
  runApp(const MainApp());
  setupGetit();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = CustomBlocObserver();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchWallpapersCubit(getIt<WallpapersRepo>())
                ..fetchWallpapers(1, KTopic.getRandomWallpaper()),
      child: const MaterialApp(
        color: Colors.white,
        onGenerateRoute: onGenerateRoute,
        initialRoute: MainView.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
