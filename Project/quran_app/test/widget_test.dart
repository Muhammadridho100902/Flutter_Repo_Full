// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quran_app/app/data/models/detail_surah.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  Future<DetailSurah> getSurahDetail(String id) async {
    Uri url = Uri.parse(
        "https://al-quran-88geof988-muhammadridho100902.vercel.app/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  await getSurahDetail(1.toString());
}

