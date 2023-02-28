// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shoes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Shoes", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w400),),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.notifications_none, color: Colors.grey, size: 30,)
            ),
            IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey, size: 30,)
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8.0, left: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("All", style: TextStyle(color: Colors.black, fontSize: 20),),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        child: Center(
                          child: Text("Sneakers", style: TextStyle(color: Colors.black, fontSize: 17),),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        child: Center(
                          child: Text("Football", style: TextStyle(color: Colors.black, fontSize: 17),),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        child: Center(
                          child: Text("Soccer", style: TextStyle(color: Colors.black, fontSize: 17),),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        child: Center(
                          child: Text("Basketball", style: TextStyle(color: Colors.black, fontSize: 17),),
                        ),
                      ),
                    ),
                  ],
                  ),
              ),
              SizedBox(height: 20.0,),
              makeItem(image: "assets/images/gerbang.jpg", tag: 'red', context: context),
              makeItem(image: "assets/images/pintu.jpg", tag: 'pintu', context: context),
              makeItem(image: "assets/images/hutan.jpg", tag: 'pintu', context: context),
              makeItem(image: "assets/images/welcome.jpg", tag: 'pintu', context: context),
              makeItem(image: "assets/images/zombie.jpg", tag: 'pintu', context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context}){
    return Hero(
      tag: tag, 
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=> Shoes(image: image,)));
        },
        child: Container(
          height: 230,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: Offset(0, 10)
                )
              ]
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sneakers", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10,),
                        Text("Nike", style: TextStyle(color: Colors.white, fontSize: 20),)
                      ],
                    )
                    ),
                    
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(
                        child: Icon(Icons.favorite_rounded, size: 20, color: Colors.red[400],),
                      ),
                    )
                ],
              ),
              Text("100\$", style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
            ],
          ),
        ),
      )
      );
  }
}