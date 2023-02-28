import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AlQuran",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: themeLight,
    ),
  );
}
