import 'package:advanced_bloc_4/second_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page')),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: BlocProvider(
    //       create: (_) => CounterBloc(),
    //       child: MyHomePage(title: 'Flutter Demo Home Page')),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, counterState) {
            if(counterState is CounterValue){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${(counterState as CounterValue).count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            }
            else if(counterState is CounterEmpty){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You reset counter:',
                    ),
                    Text(
                      '${(counterState as CounterEmpty).mess}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            }
            else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'ERROR',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            }

      }),
      floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementEvent(5)),
              tooltip: 'Increment',
              heroTag: "btn1",
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () =>
                  context.read<CounterBloc>().add(DecrementEvent(5)),
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              tooltip: 'Navigate',
              heroTag: "btn3",
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterBloc>().add(EmptyEvent()),
              tooltip: 'Null',
              heroTag: "btn4",
              child: const Icon(Icons.exposure_minus_1),
            ),
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
