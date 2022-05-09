// @packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// @part
part 'basic_state_event.dart';
part 'basic_state_state.dart';

class BasicStateBloc extends Bloc<BasicStateEvent, BasicState> {
  BasicStateBloc() : super(BasicState()) {
    on<AddNumber>((event, emit) {
      emit(BasicState(number: state.number + 1));
    });
  }
}
