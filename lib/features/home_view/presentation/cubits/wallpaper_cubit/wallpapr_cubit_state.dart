part of 'wallpaper_cubit.dart';

@immutable
sealed class WallpapersState {}

final class WallpapersInitial extends WallpapersState {}

final class WallpapersLoading extends WallpapersState {}

final class WallpapersSuccess extends WallpapersState {}

final class WallpapersFaluire extends WallpapersState {
  final String errMessage;

  WallpapersFaluire({required this.errMessage});
}
