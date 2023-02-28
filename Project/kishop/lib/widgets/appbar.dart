// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Top_Bar extends StatelessWidget {
  const Top_Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20 * 2, left: 20 * 2, bottom: 20),
          child: Container(
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width / 6,
            child: Center(
              child: Icon(
                Icons.menu_sharp,
                color: Colors.black,
                size: 60,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Kishop",
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20 * 2, right: 20 * 2, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 8,
              child: Image.asset(
                "images/foto.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
