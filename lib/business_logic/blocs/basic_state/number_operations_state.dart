part of 'number_operations_bloc.dart';

class NumberIncreasedState extends Equatable {
  final int numberIncreased;

  const NumberIncreasedState({this.numberIncreased = 0});

  @override
  List<Object?> get props => [numberIncreased];
}
