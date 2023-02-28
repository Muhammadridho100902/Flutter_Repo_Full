// first step

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String id, name, job, createdAt;

  // HttpStateful(this.name, this.id, this.job, this.createdAt);

  HttpStateful({required this.name, required this.id, required this.job, required this.createdAt});

  static Future<HttpStateful> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {"name": name, "job": job},
    );

    var data = json.decode(hasilResponse.body);

    return HttpStateful(
      name: data["name"],
      id: data["id"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }
}
