// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:inser_data_realtime/addnote.dart';

class SeeNotes extends StatefulWidget {
  const SeeNotes({Key? key}) : super(key: key);

  @override
  State<SeeNotes> createState() => _SeeNotesState();
}

class _SeeNotesState extends State<SeeNotes> {
  final fb = FirebaseDatabase.instance;

  late DateTime _myStartDate;
  String starttime = '';
  late DateTime _myEndDate;
  String endtime = '';
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();

  var l;

  var g;

  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    // final databaseRef = FirebaseDatabase.instance.ref().child("todos");

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FirebaseAnimatedList(
              shrinkWrap: true,
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                var v = snapshot.value.toString();
                g = v.replaceAll(RegExp("{|}|subtitle: |title: "), "");
                g.trim();
                l = g.split(',');
      
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      k = snapshot.key;
                    });
      
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            controller: title,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(hintText: 'Title'),
                          ),
                        ),
                        content: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            controller: notes,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(hintText: 'Sub Title'),
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            color: Colors.red,
                            child: Text("Cancel"),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await upd();
                              Navigator.of(ctx).pop();
                            },
                            color: Colors.red,
                            child: Text("Update"),
                          )
                        ],
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.indigo[200],
                        trailing: IconButton(
                          onPressed: () {
                            ref.child(snapshot.key!).remove();
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 20),
                          child: Text(
                            l[1],
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            l[0],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Notes(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  upd() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("todos");

    // only update the name
    await ref1.update(
      {"title": title.text, "subtitle": notes.text},
    );

    title.clear();
    notes.clear();
  }
}
