import 'package:flutter/material.dart';

import '../constants/color.dart';

class Textdark extends StatelessWidget {
  final Color txtcolor;
  const Textdark({
    Key? key, this.txtcolor = appWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Latest Read",
      style: TextStyle(color: txtcolor, fontSize: 20),
    );
  }
}