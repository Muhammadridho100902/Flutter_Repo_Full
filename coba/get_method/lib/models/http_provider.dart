import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data ={};

  Map<String, dynamic> get data => _data;

  int get jumlahData =>  _data.length;

  void connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);
     var hasilResponse = await http.get(url);

     var data = (json.decode(hasilResponse.body)) ["data"];

     notifyListeners();

  }
}
