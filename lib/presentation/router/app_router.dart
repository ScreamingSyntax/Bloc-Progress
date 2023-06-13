import 'package:day1/logic/cubit/CounterCubit.dart';
import 'package:day1/presentation/pages/home_page.dart';
import 'package:day1/presentation/pages/second_page.dart';
import 'package:day1/presentation/pages/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  CounterCubit counterCubit = CounterCubit();
  Route? onGenegerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings!.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: counterCubit, child: HomePage()));
      case '/second':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: counterCubit, child: SecondPage()));

      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: counterCubit, child: ThirdPage()));
      default:
        return null;
    }
  }

  void disclose() {
    counterCubit.close();
  }
}
