import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class ListLastTransaction extends StatelessWidget {
  const ListLastTransaction({
    Key? key, required this.title, required this.subTitle, required this.trailing, required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String trailing;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: 48,
      ),
      title: TitleWidgets(
        title: title,
        fontWeight: medium,
        sizeText: 16,
      ),
      subtitle: Text(
        subTitle,
        style: greyTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
      trailing: TitleWidgets(
        title: trailing,
        sizeText: 16,
      ),
    );
  }
}