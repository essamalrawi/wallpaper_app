import 'dart:math';

class KTopic {
  static const List<String> wallpapers = [
    "Mountains",
    "Galaxy",
    "Moon",
    "Snowy Landscape",
    "abstract",
  ];
  static String getRandomWallpaper() {
    final random = Random();
    return wallpapers[random.nextInt(wallpapers.length)];
  }
}
