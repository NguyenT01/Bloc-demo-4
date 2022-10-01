part of 'counter_bloc.dart';

//@immutable
abstract class CounterState {

}

class CounterValue extends CounterState {
  CounterValue(this.count);

  final int count;
}

class CounterEmpty extends CounterState{
  CounterEmpty(this.mess);

  final String mess;
}