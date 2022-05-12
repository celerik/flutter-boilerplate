part of 'number_operations_bloc.dart';

abstract class BasicStateEvent extends Equatable {}

class OnIncreaseNumber extends BasicStateEvent {
  final int number;

  OnIncreaseNumber({required this.number});

  @override
  List<Object?> get props => [number];
}
