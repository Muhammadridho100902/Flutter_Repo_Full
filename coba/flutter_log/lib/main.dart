import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_log/login_page.dart';
import 'package:flutter_log/page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter login and register php",
      initialRoute: '/',
      routes: {
        '/': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
              print("You have been log out");
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
    );
  }
}


