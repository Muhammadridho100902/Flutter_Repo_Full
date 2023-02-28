// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:laundry/widgets/icon_card.dart';
import 'package:laundry/widgets/images_cards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.black,),
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(Icons.person_outline, color: Colors.black, size: 30,),
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(padding: const EdgeInsets.only(left: 20.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Hello, ', style: TextStyle(fontSize: 38,fontWeight: FontWeight.w700, color: Colors.pinkAccent)),
                            TextSpan(text: '\nAre you ready\nfor the next journey?')
                          ],style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500, color: Colors.black)
                        )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        IconCard(iconData: Icons.home, text: 'Accomodation'),
                        IconCard(iconData: Icons.directions_bike, text: 'Experiences'),
                        IconCard(iconData: Icons.directions, text: 'Adventures'),
                        IconCard(iconData: Icons.flight, text: 'Flight'),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Best Experiences', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),)
                          ),

                          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz, color: Colors.black,)),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ImageCards(),
                    SizedBox(height: 65,),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon: Icon(Icons.home, color: Colors.pink, size: 30,)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black, size: 30,)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, color: Colors.black, size: 30,)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.person_outline, color: Colors.black, size: 30,)
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ),
    );
  }
}