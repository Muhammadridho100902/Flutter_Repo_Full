import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/recent_user_item.dart';
import 'package:bank_sha/ui/widgets/result_user_item.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  TransferPage({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
        title: const TitleWidgets(title: "Transfer"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        children: [
          FormWidget(
            title: "Search",
            textController: searchController,
            fontSize: 16,
            fontWeight: semiBold,
          ),
          const SizedBox(
            height: 40,
          ),
          // const TitleWidgets(
          //   title: "Recent",
          //   sizeText: 16,
          // ),
          // recentUsers(),
          const TitleWidgets(
            title: "Result",
            sizeText: 16,
          ),
          resultUser(),
          const SizedBox(height: 204,),
          const CustomeFilledButton(title: "Continue", width: double.infinity),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget recentUsers() {
    return Column(
      children: const [
        RecentUserItem(
          imageUrl: 'assets/profile3.png',
          name: 'M.Ridho',
          username: 'Ridho',
          isVerified: true,
        ),
        RecentUserItem(
          imageUrl: 'assets/profile4.png',
          name: 'Daffa Arkaan',
          username: 'Daffa Arkaan',
          isVerified: false,
        ),
        RecentUserItem(
          imageUrl: 'assets/profile2.png',
          name: 'Syabani Dinnove',
          username: 'Syabani Dinnove',
          isVerified: false,
        ),
      ],
    );
  }

  Widget resultUser() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Wrap(
        spacing: 20,
        runSpacing: 17,
        children: const [
          ResultUserItem(
            imageUrl: 'assets/profile3.png',
            name: 'M.Ridho',
            username: 'Ridho',
            isVerified: true,
            isSelected: true,
          ),
          ResultUserItem(
            imageUrl: 'assets/profile4.png',
            name: 'Rio',
            username: 'Rio',
            isVerified: false,
          ),
        ],
      ),
    );
  }
}
