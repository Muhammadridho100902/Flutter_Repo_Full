// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inser_data_realtime/home.dart';
import 'package:inser_data_realtime/seenote.dart';
import 'package:intl/intl.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late DateTime _myStartDate;
  String starttime = '';
  late DateTime _myEndDate;
  String endtime = '';
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();

  final db = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);
    final ref = db.ref().child('todos/$k');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                  // hintText: "Title",
                  labelText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: notes,
              decoration: InputDecoration(
                  // hintText: "Title",
                  labelText: "Notes",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 2,
                        color: Colors.grey,
                        style: BorderStyle.solid)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start Date"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      starttime,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          _myStartDate = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2025),
                          ))!;
                          setState(() {
                            starttime =
                                DateFormat('dd-mm-yyyy').format(_myStartDate);
                          });
                        },
                        child: Text("Choose the date"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 2,
                        color: Colors.grey,
                        style: BorderStyle.solid)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("End Date"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      endtime,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          _myEndDate = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2025),
                          ))!;
                          setState(() {
                            endtime =
                                DateFormat('dd-mm-yyyy').format(_myEndDate);
                          });
                        },
                        child: Text("Choose the date"),
                      ),
                    )
                  ],
                ),
              ),
              // Date_Card(
              //   title: 'End Date',
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              ref.set(
                {
                  "title": title.text,
                  "notes": notes.text,
                  "startTime": starttime.toString(),
                  "endTime": endtime.toString()
                },
              ).asStream();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SeeNotes(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 67, 200),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                      spreadRadius: 2)
                ],
              ),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}