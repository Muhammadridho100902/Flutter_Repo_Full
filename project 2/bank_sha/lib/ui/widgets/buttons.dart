import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomeFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback? onPressed;
  final Color color;

  const CustomeFilledButton({
    Key? key,
    required this.title,
    required this.width,
    this.onPressed,
    this.color = purpleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {

  final String title;
  final double width;
  final VoidCallback? onPressed;
  final Color color;
  
  const CustomTextWidget({
    Key? key,
    required this.title,
    required this.width,
    this.onPressed,
    this.color = purpleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: MediaQuery.of(context).size.height/18.42,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
