// import 'package:day1/presentation/pages/second_page.dart';
// import 'package:day1/presentation/pages/third_page.dart';
import 'package:day1/constants/enums.dart';
import 'package:day1/logic/cubit/internet_cubit.dart';
import 'package:day1/logic/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../../logic/cubit/counter_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("First Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
            if (state is InternetConnectedState &&
                state.connectionType == ConnectionType.wifi) {
              return Text("Wifi Connected");
            }
            if (state is InternetConnectedState &&
                state.connectionType == ConnectionType.mobile) {
              return Text("Mobile Data Connected");
            }
            if (state is InternetDisconnectedState) {
              return Text("Internet Disconnected");
            }
            return CircularProgressIndicator();
          }),
          Builder(
            builder: (context) {
              final internetCubit = context.watch<InternetCubit>().state;
              final counterCubit = context.watch<CounterCubit>().state;
              if (internetCubit is InternetConnectedState &&
                  internetCubit.connectionType == ConnectionType.wifi) {
                return Text(
                    'Counter: ${counterCubit.counterValue} Internet: Wifi');
              }
              if (internetCubit is InternetConnectedState &&
                  internetCubit.connectionType == ConnectionType.mobile) {
                return Text(
                    'Counter: ${counterCubit.counterValue} Internet: Mobile');
              }
              if (internetCubit is InternetDisconnectedState) {
                return const Text('Internet Disconnected');
              }
              return const CircularProgressIndicator();
            },
          ),
          const Text("The no. of times you pressed this button"),
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.isIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Incremented"),
                  duration: Duration(seconds: 1),
                ));
              }
              if (state.isIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Decremented"),
                  duration: Duration(seconds: 1),
                ));
              }
            },
            builder: (context, state) {
              return Text(
                "${BlocProvider.of<CounterCubit>(context).state.counterValue}",
                style: Theme.of(context).textTheme.displayMedium,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: '11',
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: '12',
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
              child: Text("Go to Second Screen")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");
              },
              child: Text("Got to Third Screen"))
        ],
      ),
    );
  }
}
