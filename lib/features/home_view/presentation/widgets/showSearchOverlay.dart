import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/features/category_view/presentation/abstract_view.dart';
import 'package:wallpaper_app/features/home_view/presentation/cubits/wallpaper_cubit/wallpaper_cubit.dart';

void showSearchOverlay({required BuildContext context}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder:
        (_) => Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.white.withValues(alpha: 128)),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    autofocus: true,

                    onSubmitted: (value) {
                      Navigator.of(context).pop();

                      if (value.isNotEmpty) {
                        BlocProvider.of<WallpapersCubit>(
                          context,
                        ).fetchWallpapersForSearch(value);
                        Navigator.pushNamed(context, AbstractView.routeName);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search wallpapers...",

                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
