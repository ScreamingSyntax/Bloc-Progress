import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/constants/enums.dart';
import 'package:day1/logic/cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? connectivityStreamSubscription;
  final Connectivity connectivity;
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      }
      if (event == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      }
      if (event == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnectedState(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnectedState());

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
