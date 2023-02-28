// ignore_for_file: unused_label, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:laundry/screens/home.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset('assests/travel.jpg',
             fit: BoxFit.fill,
             height: double.infinity,
             width: double.infinity,
             ),
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 height: 1000,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                     colors: [
                       Colors.black.withOpacity(1),
                       Colors.black.withOpacity(0.9),
                       Colors.black.withOpacity(0.8),
                       Colors.black.withOpacity(0.7),
                       Colors.black.withOpacity(0.6),
                       Colors.black.withOpacity(0.5),
                       Colors.black.withOpacity(0.4),
                       Colors.black.withOpacity(0.1),
                       Colors.black.withOpacity(0.05),
                       Colors.black.withOpacity(0.025),
                     ],
                     )
                 ),
               ),
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Text("FlightX", 
                 textScaleFactor: 1,
                 style: TextStyle(
                   fontSize: 40,
                   color: Colors.white,
                   fontWeight: FontWeight.w600,
                   fontFamily: 'serif'
                 ),
                 ),
                 SizedBox(height: 150,),
                 Text("Enjoy Your Flight", 
                 textScaleFactor: 1,
                 style: TextStyle(
                   fontSize: 40,
                   color: Colors.white,
                   fontWeight: FontWeight.w600
                 ),
                 ),
                 SizedBox(height: 10,),
                 Text(
                   "We'll help you to find the best \n     experience & adventures", 
                 textScaleFactor: 1,
                 style: TextStyle(
                   fontSize: 20,
                   color: Colors.white,
                   fontWeight: FontWeight.w400
                 ),
                 ),
                 SizedBox(height: 35,),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: GestureDetector(onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));
                   },
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10)),
                       child: Padding(padding: const EdgeInsets.all(10.0),
                       child: Icon(
                         Icons.arrow_forward_ios,
                         color: Colors.pink,
                       ),
                       ),
                     ),
                   ),
                   ),
                   SizedBox(height: 150,)
               ],
             )
          ],
        ),
      ),
    );
  }
}

