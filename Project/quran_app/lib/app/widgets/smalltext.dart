import 'package:flutter/material.dart';
import 'package:quran_app/app/data/models/surah.dart';

class SmallText extends StatelessWidget {
  final Surah? surah;
  final double txtsize;
  final String text;
  final Color txtcolor;
  const SmallText({
    Key? key,
    this.surah,this.txtsize = 14, required this.text, this.txtcolor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: txtsize, color: txtcolor),
    );
  }
}
