import 'dart:math';

class KTopic {
  static const List<String> wallpapers = [
    "Mountains",
    "Galaxy",
    "Moon",
    "Snowy Landscape",
  ];
  static String getRandomWallpaper() {
    final random = Random();
    return wallpapers[random.nextInt(wallpapers.length)];
  }
}
