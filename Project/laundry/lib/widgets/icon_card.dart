// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String text;

  IconCard ({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(icon: Icon(iconData, size: 30, color: Colors.pink[400],),
            onPressed: (){}),
            ),
            SizedBox(height: 5,),
            Text(text, style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }}