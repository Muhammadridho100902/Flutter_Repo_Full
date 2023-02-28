import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_service.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:bank_sha/ui/widgets/list_last_transaction.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:bank_sha/ui/widgets/tip_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/overview.png",
                  width: 20,
                  color: blueColor,
                ),
                label: "Overview"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/history.png",
                  width: 20,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/statistic.png",
                  width: 20,
                ),
                label: "Statistic"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/my_reward.png",
                  width: 20,
                ),
                label: "Reward"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: Image.asset(
          "assets/plus_circle.png",
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                buildProfile(context),
                buildWalletCard(),
                buildLevel(),
                buildServices(context),
                buildLastTransaction(),
                builSendAgain(),
                buildFriendlyTips(),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Howdy,",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const TitleWidgets(
                      title: "Shaynahan",
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/profile.png"),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                      child: Center(
                        child: Image.asset(
                          "assets/ic_check.png",
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
          width: double.infinity,
          height: 220,
          margin: const EdgeInsets.only(
            top: 32,
          ),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/card_bckgrnd.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Madelina Bond",
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "**** **** **** 1280",
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                  letterSpacing: 6,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text("Balance", style: whiteTextStyle),
              Text(
                "Rp. 12.500",
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              TitleWidgets(
                title: "Level 1",
                fontWeight: medium,
                sizeText: 14,
              ),
              const Spacer(),
              Text(
                "55%",
                style: greenTextStyle.copyWith(
                    fontWeight: semiBold, color: greenColor),
              ),
              const TitleWidgets(
                title: " of Rp.20.000",
                fontWeight: semiBold,
                sizeText: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            backgroundColor: lightBackgroundColor,
            value: 0.55,
            valueColor: AlwaysStoppedAnimation(greenColor),
            minHeight: 5,
          )
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidgets(
            title: "Do Something",
            sizeText: 16,
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeServices(
                imageUrl: 'assets/download.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topUp');
                },
              ),
              HomeServices(
                imageUrl: 'assets/send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/tranfer');
                },
              ),
              HomeServices(
                imageUrl: 'assets/withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServices(
                imageUrl: 'assets/more.png',
                title: 'More',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLastTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidgets(
            sizeText: 16,
            title: "Latest Transactions",
          ),
          Container(
            height: 356,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 14),
            // padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 10),
              children: const [
                ListLastTransaction(
                  imageUrl: 'assets/topup.png',
                  subTitle: 'Yesterday',
                  title: 'Top Up',
                  trailing: '+ 450.000',
                ),
                ListLastTransaction(
                  imageUrl: 'assets/cashback.png',
                  subTitle: 'Sep 11',
                  title: 'Cashback',
                  trailing: '+ 22.000',
                ),
                ListLastTransaction(
                  imageUrl: 'assets/withdrawgreen.png',
                  subTitle: 'Sep 2',
                  title: 'Withdraw',
                  trailing: '- 5.000',
                ),
                ListLastTransaction(
                  imageUrl: 'assets/transfer.png',
                  subTitle: 'Sep 5',
                  title: 'Transfer',
                  trailing: '- 100.000',
                ),
                ListLastTransaction(
                  imageUrl: 'assets/shopping.png',
                  subTitle: 'Sep 1',
                  title: 'Electric',
                  trailing: '- 12.300.000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidgets(
            title: "Send Again",
            sizeText: 16,
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HomeUserItem(
                    imageUrl: "assets/profile.png", username: "Yuanita"),
                HomeUserItem(imageUrl: "assets/profile2.png", username: "Jani"),
                HomeUserItem(imageUrl: "assets/profile3.png", username: "Asep"),
                HomeUserItem(
                    imageUrl: "assets/profile4.png", username: "Hassan"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const TitleWidgets(
          title: "Friendly Tips",
          sizeText: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TipsContainer(
              title: 'Best tips for using\ncredit card',
              imageUrl: 'assets/tips1.png',
              url: 'https://www.google.com',
            ),
            TipsContainer(
              title: 'Spot the good pie\nof finance model',
              imageUrl: 'assets/tips2.png',
              url: 'https://flutter.dev',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TipsContainer(
              title: 'Great hack to get\nbetter advices',
              imageUrl: 'assets/tips3.png',
              url: 'https://flutter.dev',
            ),
            TipsContainer(
              title: 'Save more penny\nbuy this instead',
              imageUrl: 'assets/tips4.png',
              url: 'https://flutter.dev',
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
