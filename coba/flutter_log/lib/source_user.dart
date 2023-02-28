import 'package:flutter_log/app_request.dart';
import 'package:flutter_log/session.dart';
import 'package:flutter_log/user.dart';
import 'package:http/http.dart' as http;

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = "http://192.168.100.7/login/login.php";
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }
}
