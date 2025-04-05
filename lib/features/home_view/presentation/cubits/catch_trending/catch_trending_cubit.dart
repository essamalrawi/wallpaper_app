import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';

import '../../../../../core/repos/wallpapers_repo.dart';

part 'catch_trending_state.dart';

class FetchWallpapersCubit extends Cubit<FetchWallpapersState> {
  FetchWallpapersCubit(this.wallpapersRepo) : super(FetchWallpapersInitial());
  int switcher = 0;
  final WallpapersRepo wallpapersRepo;
  List<WallpaperModel> wallpapers = [];
  Map<int, List<WallpaperModel>> wallpapersByPage = {1: [], 2: [], 3: []};
  Map<int, List<WallpaperModel>> wallpapersByCategory = {
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: [],
    8: [],
    9: [],
    10: [],
    11: [],
    12: [],
    13: [],
    14: [],
    15: [],
  };

  Future<void> fetchWallpapers(int page, String topic) async {
    emit(FetchWallpapersLoading());
    if (wallpapersByPage[page]!.isEmpty) {
      var result = await wallpapersRepo.fetchWallpapers(
        topic: topic,
        page: page,
      );
      result.fold(
        (failure) =>
            emit(FetchWallpapersFaluire(errMessage: failure.errMessage)),
        (right) {
          wallpapersByPage[page] = right;
          wallpapers = right;

          emit(FetchWallpapersSuccess());
        },
      );
    } else {
      wallpapers = wallpapersByPage[page]!;
      emit(FetchWallpapersSuccess());
    }
  }

  Future<void> fetchWallpapersForCategory(int page, String topic) async {
    emit(FetchWallpapersLoading());
    print(wallpapersByCategory[page]);
    if (wallpapersByCategory[page]!.isEmpty) {
      var result = await wallpapersRepo.fetchWallpapers(
        topic: topic,
        page: page,
      );
      result.fold(
        (failure) =>
            emit(FetchWallpapersFaluire(errMessage: failure.errMessage)),
        (right) {
          wallpapersByCategory[page] = right;
          wallpapers = right;

          emit(FetchWallpapersSuccess());
        },
      );
    } else {
      wallpapers = wallpapersByCategory[page]!;

      // print("Hello");
      emit(FetchWallpapersSuccess());
    }
  }
}
