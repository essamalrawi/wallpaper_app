import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/home_view/presentation/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings route) {
  switch (route.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
