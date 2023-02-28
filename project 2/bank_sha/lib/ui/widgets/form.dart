import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.title,
    required this.textController,
    this.fontSize = 14,
    this.fontWeight = medium,
  }) : super(key: key);

  final String title;
  final TextEditingController textController;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: fontSize, fontWeight: fontWeight),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          maxLength: title.contains('PIN') ? 6 : 100,
          keyboardType: title.contains("PIN")   
              ? TextInputType.number
              : TextInputType.text,
          obscureText: title == "Password" ? true : false,
          controller: textController,
          decoration: InputDecoration(
            counterText: "",
              hintText: title == "Search" ? "by username" : "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12)),
        )
      ],
    );
  }
}
