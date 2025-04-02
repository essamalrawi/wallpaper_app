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
  Future<void> fetchWallpapers(int page) async {
    emit(FetchWallpapersLoading());
    if (wallpapersByPage[page]!.isEmpty) {
      var result = await wallpapersRepo.fetchWallpapers(page: page);
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
}
