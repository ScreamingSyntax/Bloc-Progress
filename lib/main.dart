import 'package:bloc/bloc.dart';

enum CounterEvent{increment,decrement}

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc() : super(0);
  // void increment()=> emit(state+1);
  // void decrement()=> emit(state-1);

  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case CounterEvent.increment:
      yield state+1;
      break;
      case CounterEvent.decrement:
      yield state-1;
      break;
    }
    throw UnimplementedError();
  }
  
}

Future<void> main(List<String> args) async{
  final bloc = CounterBloc();
  // final streamSubscription = bloc.listen();
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);
  await Future.delayed(Duration.zero);
  await bloc.close(); 
}