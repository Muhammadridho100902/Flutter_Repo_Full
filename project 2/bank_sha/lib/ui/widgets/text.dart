import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({
    Key? key,
    required this.title,
    this.sizeText = 20,
    this.fontWeight = semiBold,
    this.textAlign,
  }) : super(key: key);

  final String title;
  final double sizeText;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      textAlign: textAlign,
      title,
      style: blackTextStyle.copyWith(
        fontSize: sizeText,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis
      ),
    );
  }
}
