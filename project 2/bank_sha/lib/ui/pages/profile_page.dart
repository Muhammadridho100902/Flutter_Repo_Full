import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/list_edit_profile.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
        title: const TitleWidgets(title: "My Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/profile.png"),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: whiteColor),
                      child: Center(
                        child: Image.asset(
                          "assets/ic_check.png",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TitleWidgets(
                  title: "Shayna Hanna",
                  fontWeight: medium,
                  sizeText: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListEditProfile(
                  imageUrl: "assets/edit_player.png",
                  title: "Edit Profile",
                  onTap: () {
                    Navigator.pushNamed(context, '/editProfile');
                  },
                ),
                ListEditProfile(
                  imageUrl: "assets/pin.png",
                  title: "My Pin",
                  onTap: () {
                    Navigator.pushNamed(context, '/editPin');
                  },
                ),
                const ListEditProfile(
                  imageUrl: "assets/wallet.png",
                  title: "Wallet Settings",
                ),
                const ListEditProfile(
                  imageUrl: "assets/reward.png",
                  title: "My Rewards",
                ),
                const ListEditProfile(
                  imageUrl: "assets/help_center.png",
                  title: "Help Center",
                ),
                const ListEditProfile(
                  imageUrl: "assets/log_out.png",
                  title: "Log Out",
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Center(
            child: Text(
              "Report a Problem",
              style: greyTextStyle.copyWith(
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}
