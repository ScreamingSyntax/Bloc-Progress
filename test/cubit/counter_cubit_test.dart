import 'package:bloc_test/bloc_test.dart';
import 'package:day1/logic/cubit/counter_cubit.dart';
import 'package:day1/logic/cubit/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CounterCubit _counterCubit = CounterCubit();
  group('This is to test the CounterCubit functions', () {
    setUp(() {
      _counterCubit = CounterCubit();
    });
    tearDown(() {
      _counterCubit.close();
    });
    test(
        'This is to test whether the default CounterCubit state is CounterState(counterValue:0,isIncremented:false)',
        () {
      expect(_counterCubit.state,
          CounterState(counterValue: 0, isIncremented: false));
    });
  });
  blocTest(
      'This is to test whether the increment function emits a state where CounterState(counterValue:1, isIncremented:true)',
      build: () => _counterCubit,
      act: (bloc) => bloc.increment(),
      expect: () => [CounterState(counterValue: 1, isIncremented: true)]);
  blocTest(
      'This is to test whether the increment function emits a state where CounterState(counterValue:-1, isIncremented:false)',
      build: () => _counterCubit,
      act: (bloc) => bloc.decrement(),
      expect: () => [CounterState(counterValue: -1, isIncremented: false)]);
}
