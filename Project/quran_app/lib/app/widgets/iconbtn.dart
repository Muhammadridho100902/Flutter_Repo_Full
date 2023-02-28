import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final IconData iconBtn;
  final double iconSize;

  const IconBtn({
    Key? key,
    this.iconSize = 24,
    required this.iconBtn
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconBtn,
      size: iconSize,
    );
  }
}
