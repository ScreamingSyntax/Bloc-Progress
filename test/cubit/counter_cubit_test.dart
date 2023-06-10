import 'package:bloc_test/bloc_test.dart';
import 'package:day1/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CounterCubit counterCubit = CounterCubit();

  group('Counter Cubit', () {
    setUp(() {
      counterCubit;
    });
    tearDown(() => {counterCubit.close()});
    test(
        'The Counter Cubit should have a initial state of CounterState(counterValue:0, isIncremented:false)',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });
  });
  blocTest(
    'The increment() function should emit a state where the value is CounterState(counterValue:1,isIncremented:true)',
    build: () => CounterCubit(),
    act: (bloc) => bloc.increment(),
    expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
  );
  blocTest(
    'The decrement() function should emit a state where the value is CounterState(counterValue:-1,isIncremented:false)',
    build: () => CounterCubit(),
    act: (bloc) => bloc.decrement(),
    expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
  );
}
