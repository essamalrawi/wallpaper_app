class WallpaperModel {
  final String image;

  WallpaperModel({required this.image});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    String tinyUrl = json['src']?['tiny'] ?? '';

    String updatedUrl = tinyUrl
        .replaceAll(RegExp(r'h=\d+'), 'h=1920')
        .replaceAll(RegExp(r'w=\d+'), 'w=1080');
    return WallpaperModel(image: updatedUrl);
  }
  static List<WallpaperModel> fromStrings(List<String> wallpapers) {
    return wallpapers.map((url) => WallpaperModel(image: url)).toList();
  }
}
