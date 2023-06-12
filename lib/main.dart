import 'package:day1/logic/cubit/CounterCubit.dart';
import 'package:day1/presentation/pages/home_page.dart';
import 'package:day1/presentation/pages/second_page.dart';
import 'package:day1/presentation/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  CounterCubit _cubit = CounterCubit();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => BlocProvider.value(
              value: _cubit,
              child: HomePage(),
            ),
        "/second": (context) => BlocProvider.value(
              value: _cubit,
              child: SecondPage(),
            ),
        "/third": (context) => BlocProvider.value(
              value: _cubit,
              child: ThirdPage(),
            )
      },
    );
  }
}
