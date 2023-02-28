// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20 * 3, top: 10),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.6,
            height: MediaQuery.of(context).size.height / 16,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                style: TextStyle(fontSize: 24, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "search",
                  prefixIcon: Icon(Icons.search_rounded, size: 24),
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 24),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              // ignore: prefer_const_literals_to_create_immutables
              gradient: LinearGradient(colors: [
                Colors.grey.shade300,
                Colors.white,
                Colors.white,
                Colors.white
              ], begin: Alignment.topCenter, end: Alignment.center),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 14,
            child: Image.asset(
              "images/setting.png",
              scale: 0.8,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
