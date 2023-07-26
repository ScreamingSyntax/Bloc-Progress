import 'dart:async';

import 'package:day1/logic/cubit/counter_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  StreamSubscription? internetStreamSubscription;
  CounterCubit() : super(CounterState(counterValue: 0, isIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));
}
