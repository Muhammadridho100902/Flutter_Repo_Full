import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  Future _onRegist() async {
    try {
      return await http.post(
        Uri.parse("http://192.168.100.7/login/register.php"),
        body: {
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        // print(data['message']);
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/home', (route) => false);

        if (data['success']) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
          // DInfo.dialogSuccess(context, "Berhasil Register");
          // DInfo.closeDialog(context, actionAfterClose: );

        } else {
          if (data['message'] == 'email') {
            DInfo.dialogError(context, 'Email sudah terdaftar');
          } else {
            DInfo.dialogError(context, 'Gagal Register');
          }
          DInfo.closeDialog(context);
        }
        return data['success'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () => _onRegist(),
                  child: const Text("Register"),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false),
                  child: const Text("You have an account?"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}