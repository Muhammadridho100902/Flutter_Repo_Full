// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_string_interpolations, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:post_method/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse =
      HttpStateful(createdAt: '', id: '', job: '', name: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            Text(
              (dataResponse.name == null)
                  ? "Belum ada data"
                  : "${dataResponse.name}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            Text(
              (dataResponse.job == null)
                  ? "Belum ada data"
                  : "${dataResponse.job}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Created At : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                (dataResponse.createdAt == null)
                    ? "Belum ada data"
                    : "${dataResponse.createdAt}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectAPI(
                  "After Night",
                  "Developer",
                ).then(
                  (value) {
                    print(value.name);
                    setState(() {
                      dataResponse = value;
                    });
                  },
                );
              },
              child: Text(
                "POST DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
