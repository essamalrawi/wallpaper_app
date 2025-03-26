import 'package:wallpaper_app/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage, name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.iconActiveIconsHome,
    inActiveImage: Assets.iconInActiveIconsHome,
    name: 'Home',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.iconActiveIconsCategory,
    inActiveImage: Assets.iconInActiveIconsCategory,
    name: 'Cateogries',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.iconActiveIconsHeart,
    inActiveImage: Assets.iconInActiveIconsHeart,
    name: 'Favorite',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.iconActiveIconsSetting,
    inActiveImage: Assets.iconInActiveIconsSetting,
    name: 'Settings',
  ),
];
