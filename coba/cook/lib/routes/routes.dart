// ignore_for_file: dead_code, prefer_const_constructors, unnecessary_new

import 'package:cook/page/SeeAll.dart';
import 'package:cook/page/detailpage.dart';
import 'package:cook/page/home.dart';
import 'package:cook/page/searchpage.dart';
import 'package:flutter/material.dart';

const String homePage = 'home_page';
const String searchPage = 'search_page';
const String seeAll = 'see_all';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());

    case searchPage:
      return MaterialPageRoute(builder: (context) => SearchPage());

    case seeAll:
      return MaterialPageRoute(builder: (context) => SeeAll());

    default:
      throw ('this page doesnt exit');
  }
}
