import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/consonants.dart';
import 'package:wallpaper_app/core/manager/navigation/navigation_cubit.dart';
import 'package:wallpaper_app/core/services/shared_preferences_singleton.dart';
import 'package:wallpaper_app/features/home_view/main_view_body.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_button_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadFavoriteWallpapers();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });

    if (state == AppLifecycleState.paused) {
      Prefs.setFavoriteWallpapers(
        context.read<WallpapersCubit>().wallpapersByFavorite,
      );
    }
  }

  void _loadFavoriteWallpapers() {
    final favoriteWallpapers = Prefs.getFavoriteWallpapers();
    context.read<WallpapersCubit>().wallpapersByFavorite = favoriteWallpapers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
      body: BlocListener<NavigationCubit, NavigationState>(
        listener: (context, state) {
          if (context.read<NavigationCubit>().currentViewIndex == 0) {
            context.read<WallpapersCubit>().fetchWallpapers(
              1,
              KTopic.getRandomWallpaper(),
            );
          }
        },
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return MainViewBody(
              currentViewIndex:
                  context.read<NavigationCubit>().currentViewIndex,
            );
          },
        ),
      ),
    );
  }
}
