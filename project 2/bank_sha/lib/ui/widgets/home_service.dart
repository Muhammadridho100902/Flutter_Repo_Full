import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({
    Key? key, required this.imageUrl, required this.title, this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
        TitleWidgets(
          title: title,
          fontWeight: medium,
          sizeText: 14,
        )
      ],
    );
  }
}