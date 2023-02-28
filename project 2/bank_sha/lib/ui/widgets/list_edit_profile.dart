import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class ListEditProfile extends StatelessWidget {
  const ListEditProfile({
    Key? key,
    required this.title,
    required this.imageUrl, this.onTap,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(
        imageUrl,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
      title: GestureDetector(
        onTap: onTap,
        child: TitleWidgets(
          title: title,
          fontWeight: medium,
          sizeText: 14,
        ),
      ),
    );
  }
}