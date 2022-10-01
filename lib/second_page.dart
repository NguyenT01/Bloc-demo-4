import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    //final counterS = BlocProvider.of<CounterBloc>(context).state;
    // return Builder(
    //   builder: (context){

        final counterS = context.select((CounterBloc bloc)=> bloc.state);
        // return BlocBuilder<CounterBloc, CounterState>(
        //   builder: (context, counterS){
            return Scaffold(
              appBar: AppBar(
                title: const Text('Page 2'),
              ),
              body: SafeArea(
                child: Center(
                  child: Text(
                    toStrByState(counterS),
                  )
                ),
              ),
            );
        //   }
        // );
    //   },
    // );
  }

  String toStrByState(CounterState cs){
      if(cs is CounterValue) {
        return '${cs.count}';
      } else if(cs is CounterEmpty){
        return cs.mess;
      }
      else {
        return 'No State';
      }
  }
}

