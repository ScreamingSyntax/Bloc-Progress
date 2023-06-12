import 'package:day1/Presentation/Screens/second_screen.dart';
import 'package:day1/Presentation/Screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'Logic/cubit/counter_cubit.dart';
import 'Presentation/Screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(),
            ),
        "/second": (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(),
            ),
        "third": (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(),
            )
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
