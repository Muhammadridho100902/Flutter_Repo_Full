import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/data/models/surah.dart';
import 'package:quran_app/app/routes/app_pages.dart';
import 'package:quran_app/app/widgets/bigtext.dart';
import 'package:quran_app/app/widgets/iconbtn.dart';
import 'package:quran_app/app/widgets/smalltext.dart';

import '../../../widgets/txtheme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.SEARCH),
            child: const IconBtn(iconBtn: Icons.search_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Assalamualaikum",
              txtsize: 26,
              txtweight: FontWeight.w600,
              txtcolor: Get.isDarkMode ? appPurple : appWhite,
            ),
            const SizedBox(
              height: 5,
            ),
            const SmallText(
              text: "Selamat Datang",
              txtsize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: Get.width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 130,
                      height: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Textdark(),
                          const BigText(
                            text: "Latest Read",
                            txtsize: 20,
                            txtcolor: appWhite,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BigText(
                            text: "Al Baqarah",
                            txtsize: 20,
                            txtcolor: Get.isDarkMode ? appPurple : appWhite,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SmallText(
                            text: "Ayat No.1",
                            txtcolor: appWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    bottom: -30,
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          "assets/image/quran.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    appPurpleLight2,
                    appPurpleLight1,
                    appPurpleDark,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // body: FutureBuilder<List<Surah>>(
      //   future: controller.getAllSurah(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (!snapshot.hasData) {
      //       return const Text("No Data");
      //     }
      //     return ListView.builder(
      //       itemCount: snapshot.data!.length,
      //       itemBuilder: (context, index) {
      //         Surah surah = snapshot.data![index];
      //         return ListTile(
      //           onTap: () {
      //             Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
      //           },
      //           leading: CircleAvatar(
      //               child: SmallText(surah: surah, text: "${surah.number}")),
      //           title: BigText(
      //             text: "${surah.name?.transliteration?.id}",
      //             txtsize: 15,
      //             surah: surah,
      //           ),
      //           subtitle: SmallText(
      //               surah: surah,
      //               text:
      //                   "${surah.numberOfVerses} Ayat | ${surah.revelation?.id}"),
      //           trailing: BigText(
      //             surah: surah,
      //             text: "${surah.name?.short}",
      //             txtsize: 15,
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
