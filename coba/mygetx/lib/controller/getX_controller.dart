// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterContoller extends GetxController{
  var counter = 0.obs;
  var isDark = false.obs;

  void changeTheme() => isDark.value = !isDark.value;

  void decrement() => counter--;
}