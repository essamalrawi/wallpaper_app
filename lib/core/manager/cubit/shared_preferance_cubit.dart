import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shared_preferance_state.dart';

class SharedPreferanceCubit extends Cubit<SharedPreferanceState> {
  SharedPreferanceCubit() : super(SharedPreferanceInitial());

  void emitUpdate() {
    emit(SharedPreferanceUpdated());
  }
}
