import 'package:day1/logic/cubit/settings_cubit.dart';
import 'package:day1/presentation/pages/home_page.dart';
import 'package:day1/presentation/pages/second_page.dart';
import 'package:day1/presentation/pages/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenegerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings!.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondPage());

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SettingsCubit>(
                  create: (context) => SettingsCubit(),
                  child: ThirdPage(),
                ));
      default:
        return null;
    }
  }
}
