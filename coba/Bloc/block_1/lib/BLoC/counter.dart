import 'dart:async';

import 'package:flutter/cupertino.dart';

class counterBLoC {
  int counter = 0;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  StreamController _outController = StreamController();
  StreamSink get _Sinkout => _outController.sink;

  Stream get ouput => _outController.stream;
  
  counterBLoC(){
    _inputController.stream.listen(
      (event) {
        if (event == 'add') {
          counter++;
        } else {
          counter--;
        }

        _Sinkout.add(counter);
       },
    );
  }

  void dispose(){
    _inputController.close();
    _outController.close();
  }
}