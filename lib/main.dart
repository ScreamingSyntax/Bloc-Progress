// import 'package:day1/presentation/pages/home_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/logic/cubit/counter_cubit.dart';
import 'package:day1/logic/cubit/internet_cubit.dart';
import 'package:day1/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  // CounterCubit _cubit = CounterCubit();

  MyApp({super.key, required this.connectivity, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              internetCubit: BlocProvider.of<InternetCubit>(context)),
        ),
      ],
      child: MaterialApp(
        // onGenerateInitialRoutes: (initialRoute) ,
        onGenerateRoute: appRouter.onGenegerateRoute,
      ),
    );
  }
}
