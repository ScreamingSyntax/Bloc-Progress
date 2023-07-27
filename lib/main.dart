// import 'package:day1/presentation/pages/home_page.dart';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/logic/cubit/counter_cubit.dart';
import 'package:day1/logic/cubit/internet_cubit.dart';
import 'package:day1/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

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
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        // onGenerateInitialRoutes: (initialRoute) ,
        onGenerateRoute: appRouter.onGenegerateRoute,
      ),
    );
  }
}
