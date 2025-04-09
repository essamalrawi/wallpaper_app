part of 'shared_preferance_cubit.dart';

@immutable
sealed class SharedPreferanceState {}

final class SharedPreferanceInitial extends SharedPreferanceState {}

final class SharedPreferanceUpdated extends SharedPreferanceState {}
