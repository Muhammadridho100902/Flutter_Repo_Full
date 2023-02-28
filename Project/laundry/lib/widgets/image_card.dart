// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:laundry/models/places.dart';
import 'package:laundry/screens/details.dart';
import 'package:laundry/widgets/images_cards.dart';

class ImageCard extends StatelessWidget {
  final String name;
  final int days;
  final String picture;
  final Place place;

  ImageCard(
      {required this.name,
      required this.days,
      required this.picture,
      required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Details(place)));
          },
          child: Container(
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(62, 168, 174, 201),
                  offset: Offset(0, 9),
                  blurRadius: 14,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assests/$picture",
                    height: 260,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )),
                        child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container())),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 5,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '$name ', style: TextStyle(fontSize: 23)),
                        ])),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today, color: Colors.white, size: 14,),
                            SizedBox(width: 5,),
                            Text('$days days', style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
