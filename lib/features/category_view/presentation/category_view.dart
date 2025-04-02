import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/category_view/presentation/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryViewBody());
  }
}
