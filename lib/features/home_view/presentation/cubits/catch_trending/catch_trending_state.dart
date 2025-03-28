part of 'catch_trending_cubit.dart';

@immutable
sealed class CatchTrendingState {}

final class CatchTrendingInitial extends CatchTrendingState {}

final class CatchTrendingLoading extends CatchTrendingState {}

final class CatchTrendingSuccess extends CatchTrendingState {}

final class CatchTrendingFaluire extends CatchTrendingState {
  final String errMessage;

  CatchTrendingFaluire({required this.errMessage});
}
