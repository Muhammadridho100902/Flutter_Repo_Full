// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Shoes extends StatefulWidget {
  final String image;

  const Shoes({Key? key, required this.image}) : super(key: key);

  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: 'red',
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.favorite_rounded,
                          size: 20,
                          color: Colors.red[400],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.0),
                      ]
                      )
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Sneakers", style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      SizedBox(height: 10,),
                      Text("Size", style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text("40", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("42", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text("44", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text("46", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 200,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                                child: Text("Buy Now", style: TextStyle(color: Colors.black, fontSize: 18),),
                              ),
                        ),
                    ],
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
