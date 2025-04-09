import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/manager/cubit/shared_preferance_cubit.dart';
import 'package:wallpaper_app/features/category_view/presentation/view/category_view.dart';
import 'package:wallpaper_app/features/favorite_view/presentation/favorite_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/home_view.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/settings_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SharedPreferanceCubit(),
      child: IndexedStack(
        index: currentViewIndex,
        children: [
          HomeView(),
          CategoryView(),
          BlocBuilder<SharedPreferanceCubit, SharedPreferanceState>(
            builder: (context, state) {
              return FavoriteView();
            },
          ),
          SettingsView(),
        ],
      ),
    );
  }
}
