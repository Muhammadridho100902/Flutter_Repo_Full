// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/getX_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterContoller c = Get.put(CounterContoller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
      theme: c.isDark.value ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  // final CounterContoller c = Get.find<CounterContoller>();
  final c = Get.find<CounterContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Text(
            "Clicks: ${c.counter}",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          c.decrement();
        },
      ),
    );
  }
}
