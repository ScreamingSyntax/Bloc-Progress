import 'package:day1/logic/cubit/CounterCubit.dart';
import 'package:day1/presentation/pages/home_page.dart';
import 'package:day1/presentation/pages/second_page.dart';
import 'package:day1/presentation/pages/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenegerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings!.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondPage());

      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdPage());
      default:
        return null;
    }
  }
}
