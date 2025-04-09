import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/functions/on_generate_route.dart';
import 'package:wallpaper_app/core/manager/navigation/navigation_cubit.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo.dart';
import 'package:wallpaper_app/core/services/shared_preferences_singleton.dart';
import 'package:wallpaper_app/core/utils/custom_bloc_observer.dart';
import 'package:wallpaper_app/core/utils/get_it_service.dart';
import 'package:wallpaper_app/features/home_view/main_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/my_http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupGetit();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = CustomBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WallpapersCubit>(
          create:
              (context) =>
                  WallpapersCubit(getIt<WallpapersRepo>())
                    ..fetchWallpapers(1, KTopic.getRandomWallpaper()),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
      ],

      child: const MaterialApp(
        color: Colors.white,
        onGenerateRoute: onGenerateRoute,
        initialRoute: MainView.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
