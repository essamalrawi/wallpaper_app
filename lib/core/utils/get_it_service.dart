import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo.dart';
import 'package:wallpaper_app/core/repos/wallpapers_repo_impl.dart';
import 'package:wallpaper_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  getIt.registerSingleton<WallpapersRepo>(
    WallpapersRepoImpl(apiService: getIt<ApiService>()),
  );
}
