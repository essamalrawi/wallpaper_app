import 'package:either_dart/either.dart';
import 'package:wallpaper_app/core/errors/faluire.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';

abstract class WallpapersRepo {
  Future<Either<Failure, List<WallpaperModel>>> fetchWallpapers(String? topic);
}
