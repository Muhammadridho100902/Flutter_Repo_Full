// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  late Uri url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];

      handlingStatusCode(context,"Berhasil Get Data");

      notifyListeners();
    } else {
      handlingStatusCode(context, "Error ${hasilResponse.statusCode}");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);

    print(hasilResponse.statusCode);

    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      handlingStatusCode(context, "No Content");
    }
  }

  handlingStatusCode(BuildContext context, String Message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Message),
        duration: Duration(seconds: 1),
      ),
    );
  }

}
