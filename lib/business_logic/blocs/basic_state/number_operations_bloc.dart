
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// @part
part 'number_operations_event.dart';
part 'number_operations_state.dart';

class NumberOperationsBloc extends Bloc<BasicStateEvent, NumberIncreasedState> {
  NumberOperationsBloc() : super(NumberIncreasedState()) {
    on<OnIncreaseNumber>((event, emit) {
      emit(NumberIncreasedState(numberIncreased: event.number + 1));
    });
  }
}
