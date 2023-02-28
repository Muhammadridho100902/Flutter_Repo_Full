import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/routes/app_pages.dart';
import 'package:quran_app/app/widgets/bigtext.dart';
import 'package:quran_app/app/widgets/smalltext.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: "Al Quran",
              txtsize: 40,
              txtweight: FontWeight.w500,
              txtcolor: Get.isDarkMode ? appWhite : appPurple,
            ),
            const SizedBox(
              height: 10,
            ),
            const SmallText(
              text: "Learn Quran and Recite once Everyday",
              txtsize: 20,
              txtcolor: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    // color: Get.isDarkMode ? appPurpleDark : appWhite,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode ? appWhite : appPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
