// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:laundry/models/places.dart';

class Details extends StatelessWidget {
  final Place place;

  Details(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assests/${place.image}',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${place.days} days',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                       TextSpan(text: '${place.place} \n', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black)),
                       TextSpan(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum')
                      ], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey,)
                      )
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)
                      ),
                      color: Colors.pink[400]
                      ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'price\n' ,style: TextStyle(fontSize: 18)),
                              TextSpan(text: '\$300' , style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700,
                                )
                              )
                            ]
                          ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.black,
                                blurRadius: 8,
                                offset: Offset(1, 1)
                                )
                              ]
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Book a tour', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w400),),),
                          ),
                          )
                    ],
                  ),
                  ),
                )
            ],
          ),

          Positioned(
            top: 40,
            left: 15,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_rounded, size: 35, color: Colors.pink[400],),
              ),
            )
            )
        ],
      ),
    );
  }
}
