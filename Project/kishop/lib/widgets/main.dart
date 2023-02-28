// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Stack(
        children: [
          Positioned(
            top: 200,
            left: 50,
            width: 400,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 3,
                    color: Colors.grey.shade200
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            width: 300,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 3,
                    color: Colors.grey.shade200
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
