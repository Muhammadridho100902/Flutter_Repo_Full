import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterBlock extends Bloc<String, int>{
//   CounterBlock() : super(0);

//   int counter = 0;

//   Stream<int> mapEventToState(event)async*{
//     if (event == 'add') {
//       counter++;
//     } else {
//       counter--;
//     }
//     //yield function is return the stream and need add "async*"
//     yield counter;
//   }
// }

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}