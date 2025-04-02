part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationHome extends NavigationState {}

final class NavigationCategory extends NavigationState {}

final class NavigationFavorite extends NavigationState {}

final class NavigationSettings extends NavigationState {}
