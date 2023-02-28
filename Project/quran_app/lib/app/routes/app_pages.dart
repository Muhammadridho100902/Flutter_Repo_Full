import 'package:get/get.dart';

import 'package:quran_app/app/modules/detail_surah/bindings/detail_surah_binding.dart';
import 'package:quran_app/app/modules/detail_surah/views/detail_surah_view.dart';
import 'package:quran_app/app/modules/home/bindings/home_binding.dart';
import 'package:quran_app/app/modules/home/views/home_view.dart';
import 'package:quran_app/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:quran_app/app/modules/introduction/views/introduction_view.dart';
import 'package:quran_app/app/modules/search/bindings/search_binding.dart';
import 'package:quran_app/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
