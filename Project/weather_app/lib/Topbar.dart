// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constans.dart';

class Topbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_rounded),
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: kDefaultPadding * 2.5),
          child: Text(
            "Plant App",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: kDefaultPadding * 2, top: kDefaultPadding * 4),
                  child: Text(
                    "Hi! Welcome \nMuhammad Ridho",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                            offset: Offset(5, 5),
                            blurRadius: 20,
                            color: Colors.black54),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: kDefaultPadding,bottom: kDefaultPadding / 2),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                        left: kDefaultPadding,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search . . .",
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 5),
                              blurRadius: 10,
                              color: Colors.black54.withOpacity(0.5)),
                        ]),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20 * 4, left: 20 * 2),
              ),
              Text(
                "Recommend",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor.withOpacity(0.8),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 20 * 2),
                child: FlatButton(
                  color: kPrimaryColor.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {},
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
