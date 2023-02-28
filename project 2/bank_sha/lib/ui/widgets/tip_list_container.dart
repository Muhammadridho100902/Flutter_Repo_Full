import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TipsContainer extends StatelessWidget {
  const TipsContainer({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.url,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri _url = Uri.parse(url);
        if (await canLaunchUrl(_url)) {
          launchUrl(
            _url,
            mode: LaunchMode.inAppWebView,
            webViewConfiguration: const WebViewConfiguration(),
          );
        }
      },
      child: Container(
        height: 176,
        width: 155,
        margin: const EdgeInsets.only(top: 14, bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Container(
              height: 110,
              width: 155,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TitleWidgets(
              title: title,
              sizeText: 14,
              fontWeight: medium,
            )
          ],
        ),
      ),
    );
  }
}
