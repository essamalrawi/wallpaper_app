import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/views/wallpaper_view.dart';
import 'package:wallpaper_app/features/category_view/presentation/abstract_view.dart';
import 'package:wallpaper_app/features/home_view/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings route) {
  switch (route.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case AbstractView.routeName:
      return MaterialPageRoute(builder: (contetxt) => AbstractView());
    case WallpaperView.routeName:
      return MaterialPageRoute(builder: (contetxt) => WallpaperView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
