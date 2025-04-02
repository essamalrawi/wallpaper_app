part of 'catch_trending_cubit.dart';

@immutable
sealed class FetchWallpapersState {}

final class FetchWallpapersInitial extends FetchWallpapersState {}

final class FetchWallpapersLoading extends FetchWallpapersState {}

final class FetchWallpapersSuccess extends FetchWallpapersState {}

final class FetchWallpapersFaluire extends FetchWallpapersState {
  final String errMessage;

  FetchWallpapersFaluire({required this.errMessage});
}
