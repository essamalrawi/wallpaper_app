import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/core/models/wallpaper_model.dart';

import '../../../../../core/repos/wallpapers_repo.dart';

part 'catch_trending_state.dart';

class CatchTrendingCubit extends Cubit<CatchTrendingState> {
  CatchTrendingCubit(this.wallpapersRepo) : super(CatchTrendingInitial());
  final WallpapersRepo wallpapersRepo;
  List<WallpaperModel> wallpapers = [];
  Future<void> fetchTrendingImage() async {
    emit(CatchTrendingLoading());
    var result = await wallpapersRepo.fetchWallpapers("Trending");
    result.fold((e) => emit(CatchTrendingFaluire(errMessage: e.errMessage)), (
      w,
    ) {
      wallpapers = w;

      CatchTrendingSuccess();
    });
  }
}
