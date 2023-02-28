// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData dark = ThemeData.dark();
  final ThemeData light = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBlock(),
        ),
        BlocProvider(
          create: (context) => ThemeBlock(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CounterBlock, int>(
            listener: (context, state) {
              //statement
              if (state > 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Lebih dari 10"),
                  ),
                );
              }
            },
          ),
          BlocListener<ThemeBlock, bool>(
            listener: (context, state) {
              //statement
              if (state) {}
            },
          ),
        ],
        child: BlocBuilder<ThemeBlock, bool>(
          builder: (context, state) => MaterialApp(
            theme: state ? dark : light,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBlock, int>(
          builder: (context, state) => Text(
            "$state",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBlock>().increment(),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<ThemeBlock>().changetheme(),
            child: Icon(
              Icons.color_lens,
            ),
          ),
        ],
      ),
    );
  }
}

class CounterBlock extends Cubit<int> {
  CounterBlock() : super(0);

  void increment() => emit(state + 1);
}

class ThemeBlock extends Cubit<bool> {
  ThemeBlock() : super(false);

  void changetheme() => emit(!state);
}
