import 'package:argonovo/business_logic/blocs/basic_state/number_operations_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Increasing numbers', () {
    const input = 0;
    const expectedOutput = 1;

    blocTest<NumberOperationsBloc, NumberIncreasedState>(
      'Should return NumberIncreasedState when OnIncreaseNumber is sent as event and works successfully',
      build: () => NumberOperationsBloc(),
      act: (bloc) => bloc.add(OnIncreaseNumber(number: input)),
      expect: () => [
        isA<NumberIncreasedState>()
            .having((state) => state.numberIncreased, 'numberIncreased', expectedOutput)
      ],
    );
  });
}
