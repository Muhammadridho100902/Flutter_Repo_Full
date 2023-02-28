import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_record_bwa/config/app_color.dart';
import 'package:money_record_bwa/config/session.dart';
import 'package:money_record_bwa/data/model/user.dart';
import 'package:money_record_bwa/presentation/page/auth/login_page.dart';
import 'package:money_record_bwa/presentation/page/auth/register_page.dart';
import 'package:money_record_bwa/presentation/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white
        )
      ),
      home: FutureBuilder(
        builder: (context, AsyncSnapshot<User>snapshot) {
          if (snapshot.data!= null && snapshot.data!.idUser!= null) {
            return const HomePage();
          }
          return const LoginPage();
        }, 
        future: Session.getUser(),
        ),
    );
  }
}
