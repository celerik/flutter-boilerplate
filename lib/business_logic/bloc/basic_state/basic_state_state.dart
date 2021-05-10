// @part
part of 'basic_state_bloc.dart';

class BasicState {
  final int number;

  BasicState({this.number = 0});

  BasicState copyWith({int number}) {
    return BasicState(number: number ?? this.number);
  }
}
