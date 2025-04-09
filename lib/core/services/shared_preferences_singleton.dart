import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setFavoriteWallpapers(List<String> urls) async {
    await _instance.setStringList("favorite_wallpapers", urls);
  }

  static List<String> getFavoriteWallpapers() {
    List<String> list = _instance.getStringList("favorite_wallpapers") ?? [];
    return list;
  }
}
