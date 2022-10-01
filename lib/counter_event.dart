part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent{
  IncrementEvent(this.count);

  final int count;
}

class DecrementEvent extends CounterEvent{
  DecrementEvent(this.count);

  final int count;
}

class EmptyEvent extends CounterEvent{
  EmptyEvent();
}