import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        title: const TitleWidgets(title: "Top Up"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWidgets(
                    title: "Wallet",
                    sizeText: 16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/card_bckgrnd small.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleWidgets(title: "8008 2208 1996"),
                          Text(
                            "Muhammad Ridho",
                            style: greyTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TitleWidgets(
                    title: "Select Bank",
                    sizeText: 16,
                  ),
                  const BankListContainer(
                    imageUrl: "assets/bca.png",
                    title: "BANK BCA",
                    time: "50 Mins",
                    isSelected: true,
                  ),
                  const BankListContainer(
                    imageUrl: "assets/bni.png",
                    title: "BANK BNI",
                    time: "50 Mins",
                  ),
                  const BankListContainer(
                    imageUrl: "assets/mandiri.png",
                    title: "BANK MANDIRI",
                    time: "50 Mins",
                  ),
                  const BankListContainer(
                    imageUrl: "assets/ocbc.png",
                    title: "BANK OCBC",
                    time: "50 Mins",
                  ),
                  const SizedBox(height: 30,),
                  CustomeFilledButton(title: "Continue", width: double.infinity,onPressed: () {
                    Navigator.pushNamed(context, '/pin');
                  },)
                ],
              ),
            ],
          )),
    );
  }
}

class BankListContainer extends StatelessWidget {
  const BankListContainer({
    Key? key,
    required this.title,
    required this.time,
    required this.imageUrl,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final String time;
  final String imageUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border:
              Border.all(width: 2, color: isSelected ? blueColor : whiteColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: title.contains("OCBC") ? 142.54 : 106,
            height: title.contains("BCA") ? 33.5 : 30.11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleWidgets(
                title: title,
                fontWeight: medium,
                sizeText: 16,
              ),
              Text(
                time,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
