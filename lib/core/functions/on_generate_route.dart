import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/home_view/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings route) {
  switch (route.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
