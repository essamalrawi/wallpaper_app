import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int _index = 0;

  int get currentViewIndex => _index;
  void changeIndex(int currentIndex) {
    if (currentIndex != _index) {
      _index = currentIndex;
      emit(NavigationUpdated());
    }
  }
}
