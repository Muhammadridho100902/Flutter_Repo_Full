import 'dart:convert';

import 'package:http/http.dart';

import '../model/user_model.dart';

class ApiRepository {
  final String mainUrl = "https://reqres.in/api/users?page=1";

  Future<List<UserModel>> getAllData() async {
    Response response = await get(
      Uri.parse(mainUrl),
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else{
      throw Exception(response.reasonPhrase);
    }
  }

  
}