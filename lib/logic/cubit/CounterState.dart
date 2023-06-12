import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;
  bool isIncremented;
  CounterState({required this.counterValue, required this.isIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, isIncremented];
}
