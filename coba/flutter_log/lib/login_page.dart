import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_log/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  Future Login() async {

    try {
      return await http.post(
        Uri.parse("http://192.168.100.7/api_money_record/user/login.php"),
        body: {
          'email' : emailController.text,
          'password' : passwordController.text
        },
      ).then((value) {
        var data = jsonDecode(value.body);

        if (data.toString() == ['success']) {
          DInfo.dialogSuccess(context, "Berhasil Login");
          DInfo.closeDialog(context, actionAfterClose: ()=> Get.off(HomePage()));
        } else {
          DInfo.dialogError(context, "gagal login");
          DInfo.closeDialog(context);
        }
        return data;

      });
    } catch (e) {
      return e;
    }


    // var url = Uri.parse("http://192.168.100.7/api_money_record/user/login.php");
    // var response = await http.post(url, body: {
    //   'email' : emailController,
    //   'password' : passwordController,
    // });
    // var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    //   DInfo.dialogSuccess(context, "Login berhasil");
    //   DInfo.closeDialog(context, actionAfterClose: (){
    //     Get.off(const HomePage());
    //   });
    // } else{
    //   DInfo.dialogError(context, "Login Gagal");
    //   DInfo.closeDialog(context);
    // }
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
                  onPressed: () => Login(),
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
