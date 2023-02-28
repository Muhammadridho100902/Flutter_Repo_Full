// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_flutter_realtime/home.dart';
import 'package:shopping_flutter_realtime/main.dart';

class addNote extends StatefulWidget {
  const addNote({Key? key}) : super(key: key);

  @override
  State<addNote> createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {
  late DateTime _myStartDate;
  String starttime = '';
  late DateTime _myEndDate;
  String endtime = '';

  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TextField(
                  controller: second,
                  decoration: InputDecoration(hintText: "title"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TextField(
                  controller: third,
                  decoration: InputDecoration(hintText: "sub title"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width / 2,
              //       height: 160,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(20),
              //           border: Border.all(
              //               width: 2,
              //               color: Colors.grey,
              //               style: BorderStyle.solid)),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("Start Date"),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Text(
              //             starttime,
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 24,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
              //             child: ElevatedButton(
              //               onPressed: () async {
              //                 _myStartDate = (await showDatePicker(
              //                   context: context,
              //                   initialDate: DateTime.now(),
              //                   firstDate: DateTime(2015),
              //                   lastDate: DateTime(2025),
              //                 ))!;
              //                 setState(() {
              //                   starttime = DateFormat('dd-mm-yyyy')
              //                       .format(_myStartDate);
              //                 });
              //               },
              //               child: Text("Choose the date"),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width / 2,
              //       height: 160,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(20),
              //           border: Border.all(
              //               width: 2,
              //               color: Colors.grey,
              //               style: BorderStyle.solid)),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("End Date"),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Text(
              //             endtime,
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 24,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
              //             child: ElevatedButton(
              //               onPressed: () async {
              //                 _myEndDate = (await showDatePicker(
              //                   context: context,
              //                   initialDate: DateTime.now(),
              //                   firstDate: DateTime(2015),
              //                   lastDate: DateTime(2025),
              //                 ))!;
              //                 setState(() {
              //                   endtime =
              //                       DateFormat('dd-mm-yyyy').format(_myEndDate);
              //                 });
              //               },
              //               child: Text("Choose the date"),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //     // Date_Card(
              //     //   title: 'End Date',
              //     // ),
              //   ],
              // ),
              MaterialButton(
                onPressed: () {
                  ref.set({
                    "title": second.text,
                    "subtitle": third.text,
                  }).asStream();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: Text("Save"),
                color: Colors.indigo[200],
              )
            ],
          ),
        ),
      ),
    );
  }
}
