// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:cook/page/searchpage.dart';
import 'package:cook/routes/routes.dart';
import 'package:cook/widgets/hello_profile.dart';
import 'package:cook/widgets/search_bar.dart';
import 'package:cook/widgets/see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Hello_Profile(user: 'Ridho'),
          Search_Bar(),
          See_Container(),
        ],
      ),
    );
  }
}

