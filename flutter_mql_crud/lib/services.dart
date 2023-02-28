import 'dart:convert';

import 'package:flutter_mql_crud/model.dart';
import 'package:http/http.dart' as http;

class Services {
  static const ROOT = "http://localhost/practice_flutter_crud/conn.php";
  static const createTabel = "CREATE_TABLE";
  static const getDataEmp = "GET_ALL";
  static const addDataEmp = "ADD_EMP";
  static const updateDataEmp = "UPDATE_EMP";
  static const deleteDataEmp = "DELETE_EMP";

  // method create table employee
  static Future<String> createTable() async {
    try {
      // add the paramaters to pass the request;
      var map = <String, dynamic>{};
      map['action'] = createTabel;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Create table respone ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else{
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Employee>> getEmployee() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = getDataEmp;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("get Employee ${response.body}");
      if (200 == response.statusCode) {
        List<Employee> listEmp = parseResponse(response.body);
        return listEmp;
      } else {
        return List<Employee>.empty();
      }
    } catch (e) {
      return List<Employee>.empty();
    }
  }

  static List<Employee> parseResponse(String responseBody) {
    final parse = json.decode(responseBody).cast<Map<String, dynamic>>();
    // return parse.map<Employee>((json) => Employee.fromJson(json)).toString();
    return parse.map<Employee>((json) => Employee.fromJson(json));
  }

  // method to add emp to database
  static Future<String> addEmploye(String firstName, String lastName) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = addDataEmp;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Add Employee response ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> updateEmployee(int empid, String firstName, String lastName)async{
    try {
      var map = <String, dynamic>{};
      map['action'] = updateDataEmp;
      map['emp_id'] = empid;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Add Employee response ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> deleteEmployee(int empid)async{
    try {
      var map = <String, dynamic>{};
      map['action'] = deleteDataEmp;
      map['emp_id'] = empid;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Add Employee response ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
