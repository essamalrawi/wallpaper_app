import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/home_view/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
