import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:wallpaper_app/core/widgets/in_active_item.dart';

import 'active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.entity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(text: entity.name, image: entity.activeImage)
        : InActiveItem(image: entity.inActiveImage);
  }
}
