import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class SiginScrenn extends StatelessWidget {
  SiginScrenn({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7.37,
              bottom: MediaQuery.of(context).size.height / 14.74,
            ),
            height: MediaQuery.of(context).size.height / 14.74,
            width: MediaQuery.of(context).size.width / 2.52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/logo_black.png",
                ),
              ),
            ),
          ),
          const TitleWidgets(
            title: "Sign In &\nGrow Your Finance",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24.56,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormWidget(
                  textController: emailController,
                  title: 'Email Address',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 46.06,
                ),
                FormWidget(
                  textController: passwordController,
                  title: 'Password',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 92.12,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password",
                      style: blueTextStyle,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 24.56,
                ),
                CustomeFilledButton(
                  title: 'Sign In',
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 73.7,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24.56,
          ),
          CustomTextWidget(
            title: 'Create New Account',
            width: double.infinity,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/signUp', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
