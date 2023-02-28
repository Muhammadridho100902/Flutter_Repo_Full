import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/app/data/models/detail_surah.dart';

class DetailSurahController extends GetxController {
  // use Mapping because the data is Map not a list
  Future<DetailSurah> getSurahDetail(String id) async {
    Uri url = Uri.parse(
        "https://al-quran-88geof988-muhammadridho100902.vercel.app/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }
}
