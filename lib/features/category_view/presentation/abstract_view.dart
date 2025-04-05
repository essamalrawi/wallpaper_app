import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/category_view/presentation/view/widgets/abstract_body.dart';

class AbstractView extends StatelessWidget {
  const AbstractView({super.key});
  static const String routeName = "abstract_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AbstractViewBody()));
  }
}
