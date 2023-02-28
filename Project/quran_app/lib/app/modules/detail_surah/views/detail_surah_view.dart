import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/data/models/detail_surah.dart' as detail;
import 'package:quran_app/app/data/models/surah.dart';
import 'package:quran_app/app/widgets/smalltext.dart';

import '../../../constants/color.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/iconbtn.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;

  DetailSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          surah: surah,
          text: 'Surah ${surah.name?.transliteration?.id?.toUpperCase()}',
          txtsize: 20,
          txtcolor: Get.isDarkMode ? appWhite : appPurple,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  BigText(
                    surah: surah,
                    text: "${surah.name?.transliteration!.id}",
                    txtcolor: Get.isDarkMode ? appWhite : appPurple,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SmallText(
                    surah: surah,
                    text: "(${surah.name?.translation?.id})",
                    txtsize: 16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    surah: surah,
                    text:
                        "${surah.numberOfVerses} Ayat || ${surah.revelation?.id}",
                    txtsize: 14,
                  )
                ],
              ),
            ),
          ),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getSurahDetail(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const SizedBox();
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.verses?.length,
                itemBuilder: (context, index) {
                  detail.Verse? ayat = snapshot.data!.verses?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${index + 1}"),
                              Row(
                                children: const [
                                  IconBtn(
                                    iconBtn: Icons.bookmark_border_outlined,
                                  ),
                                  IconBtn(iconBtn: Icons.play_arrow_outlined),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 23, left: 35),
                        child: Text(
                          "${ayat?.text?.arab}",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        child: Text(
                          "(${ayat?.text?.transliteration?.en})",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
