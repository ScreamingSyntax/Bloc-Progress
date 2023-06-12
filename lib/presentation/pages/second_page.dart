import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/CounterCubit.dart';
import '../../logic/cubit/CounterState.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                heroTag: '12',
                // tooltip: '11',
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: '11',
                // tooltip: '12',
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"))
        ],
      ),
    );
  }
}
