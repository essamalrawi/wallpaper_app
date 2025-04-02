import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int _index = 0;
  int get index => _index;
  void changeIndex(int currentIndex) {
    _index = currentIndex;

    if (currentIndex == 0) {
      emit(NavigationHome());
    } else if (currentIndex == 1) {
      emit(NavigationCategory());
    } else if (currentIndex == 2) {
      emit(NavigationFavorite());
    } else if (currentIndex == 3) {
      emit(NavigationSettings());
    }
  }
}
