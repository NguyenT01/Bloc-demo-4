import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValue(0)) {

    on<IncrementEvent>((event, emit) => _addToValue(event.count, emit));
    on<DecrementEvent>((event, emit) => _addToValue(event.count*-1, emit));
    on<EmptyEvent>((event, emit) => emit(CounterEmpty("reset to 0")));
  }

  void _addToValue(int value, Emitter<CounterState> emit) {
    if(state is CounterValue){
      emit(CounterValue((state as CounterValue).count +value));
    }
    else{
      emit(CounterValue(value));
    }
  }



}
