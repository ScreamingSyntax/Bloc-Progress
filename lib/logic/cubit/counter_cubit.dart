import 'dart:async';

import 'package:day1/constants/enums.dart';
import 'package:day1/logic/cubit/counter_state.dart';
import 'package:day1/logic/cubit/internet_cubit.dart';
import 'package:day1/logic/cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, isIncremented: false)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen((event) {
      if (event is InternetConnectedState &&
          event.connectionType == ConnectionType.wifi) {
        increment();
      }
      if (event is InternetConnectedState &&
          event.connectionType == ConnectionType.mobile) {
        increment();
      }
      if (event is InternetDisconnectedState) {
        decrement();
      }
    });
  }

  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));
}
