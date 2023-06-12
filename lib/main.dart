import 'package:day1/logic/cubit/CounterCubit.dart';
import 'package:day1/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(), child: HomePage()),
    );
  }
}
