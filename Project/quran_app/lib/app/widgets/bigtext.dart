import 'package:flutter/material.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/data/models/surah.dart';

class BigText extends StatelessWidget {
  final Surah? surah;
  final dynamic txtweight;
  final double txtsize;
  final String text;
  final dynamic txtalign;
  final Color txtcolor;
  const BigText({
    Key? key,
    this.surah,
    required this.text,
    this.txtsize = 26,
    this.txtweight = FontWeight.w500,
    this.txtalign = TextAlign.justify, this.txtcolor = appWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: txtalign,
      style: TextStyle(
        color: txtcolor,
        fontSize: txtsize,
        fontWeight: txtweight,
      ),
    );
  }
}
