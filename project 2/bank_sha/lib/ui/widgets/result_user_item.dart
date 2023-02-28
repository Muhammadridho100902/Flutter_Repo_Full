import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class ResultUserItem extends StatelessWidget {

    final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;

  const ResultUserItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2
        )
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
              child: isVerified ? Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: whiteColor),
                  child: Center(
                    child: Image.asset(
                      "assets/ic_check.png",
                    ),
                  ),
                ),
              ) : null
            ),
            const SizedBox(
              height: 13,
            ),
            TitleWidgets(
              title: name,
              fontWeight: medium,
              sizeText: 16,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "@$username",
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}