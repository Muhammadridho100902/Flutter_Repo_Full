// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kishop/widgets/appbar.dart';
import 'package:kishop/widgets/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Top_Bar(),
          Search_Bar(),
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
                child: Container(
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Colors.blue, 
                        Colors.red,
                        Colors.orangeAccent.shade200
                        ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                right: -20,
                bottom: -56,
                height: 450,
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue
                      ),
                  child: Image.asset(
                    "images/Nike.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
