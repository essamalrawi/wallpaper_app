import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:wallpaper_app/core/errors/faluire.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo.dart';
import 'package:wallpaper_app/core/utils/api_service.dart';

class WallpapersRepoImpl implements WallpapersRepo {
  final ApiService apiService;

  WallpapersRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<WallpaperModel>>> fetchWallpapers(
    String? topic,
  ) async {
    try {
      var data = await apiService.get(
        endPoint: 'search?query=wallpaper $topic',
      );

      List<WallpaperModel> wallpapers = [];
      for (var item in data['photos']) {
        wallpapers.add(WallpaperModel.fromJson(item));
      }
      return Right(wallpapers);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
