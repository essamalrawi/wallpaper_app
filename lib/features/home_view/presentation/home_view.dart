import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = "home_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: CustomButtonNavigationBar(),
    );
  }
}
