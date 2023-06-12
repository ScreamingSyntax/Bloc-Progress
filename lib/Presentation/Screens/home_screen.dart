import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is home screen"),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented"),
              duration: Duration(seconds: 2),
            ));
          }
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented"),
              duration: Duration(seconds: 2),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have pressed this button for this many times"),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return const Text("The counter value is negative");
                  }
                  if (state.counterValue % 2 == 0) {
                    return Text(
                        "The counter value ${state.counterValue} is divisible by 2");
                  }
                  return Text(
                    "Hello ${state.counterValue}",
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: 'minus',
                    tooltip: 'Decrement',
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'plus',
                    tooltip: 'Increment ',
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () => {Navigator.of(context).pushNamed("/second")},
                  child: Text("Go To Second Screen")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("third");
                  },
                  child: Text("Go to Third Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
