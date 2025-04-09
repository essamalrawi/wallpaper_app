import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';

import '../../../../../core/repos/wallpapers_repo.dart';

part 'wallpapr_cubit_state.dart';

class WallpapersCubit extends Cubit<WallpapersState> {
  WallpapersCubit(this.wallpapersRepo) : super(WallpapersInitial());
  int switcher = 0;
  late String selectedImage;
  final WallpapersRepo wallpapersRepo;
  List<WallpaperModel> wallpapers = [];
  Map<int, List<WallpaperModel>> wallpapersByPage = {1: [], 2: [], 3: []};
  List<String> wallpapersByFavorite = [];

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
    emit(WallpapersLoading());
    if (wallpapersByPage[page]!.isEmpty) {
      var result = await wallpapersRepo.fetchWallpapers(
        topic: topic,
        page: page,
      );
      result.fold(
        (failure) => emit(WallpapersFaluire(errMessage: failure.errMessage)),
        (right) {
          wallpapersByPage[page] = right;
          wallpapers = right;

          emit(WallpapersSuccess());
        },
      );
    } else {
      wallpapers = wallpapersByPage[page]!;
      emit(WallpapersSuccess());
    }
  }

  Future<void> fetchWallpapersForCategory(int page, String topic) async {
    emit(WallpapersLoading());

    if (wallpapersByCategory[page]!.isEmpty) {
      var result = await wallpapersRepo.fetchWallpapers(
        topic: topic,
        page: page,
      );
      result.fold(
        (failure) => emit(WallpapersFaluire(errMessage: failure.errMessage)),
        (right) {
          wallpapersByCategory[page] = right;
          wallpapers = right;

          emit(WallpapersSuccess());
        },
      );
    } else {
      wallpapers = wallpapersByCategory[page]!;

      emit(WallpapersSuccess());
    }
  }

  Future<void> fetchWallpapersForSearch(String topic) async {
    emit(WallpapersLoading());

    var result = await wallpapersRepo.fetchWallpapers(topic: topic, page: 1);
    result.fold(
      (failure) => emit(WallpapersFaluire(errMessage: failure.errMessage)),
      (right) {
        wallpapers = right;

        emit(WallpapersSuccess());
      },
    );
  }

  void addFavoriteWallpaper(String urlImage) {
    if (!wallpapersByFavorite.contains(urlImage)) {
      wallpapersByFavorite.add(urlImage);

      emit(WallpapersSuccess());
    }
  }

  void removeFavoriteWallpaper(String urlImage) {
    if (wallpapersByFavorite.contains(urlImage)) {
      wallpapersByFavorite.remove(urlImage);

      emit(WallpapersSuccess());
    }
  }

  bool checkIfFavWallpaperExist(String urlImage) {
    if (wallpapersByFavorite.contains(urlImage)) {
      return true;
    }

    return false;
  }

  bool checkIfFavWallpaperIsNotEmpty() {
    if (wallpapersByFavorite.isNotEmpty) {
      return true;
    }
    return false;
  }
}
