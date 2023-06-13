// import 'package:day1/presentation/pages/home_page.dart';
import 'package:day1/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // CounterCubit _cubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateInitialRoutes: (initialRoute) ,
      onGenerateRoute: _appRouter.onGenegerateRoute,
    );
  }
}
