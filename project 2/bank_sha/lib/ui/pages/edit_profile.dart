import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        title: const TitleWidgets(title: "Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                FormWidget(
                    title: "Username", textController: usernameController),
                const SizedBox(
                  height: 16,
                ),
                FormWidget(
                    title: "Full Name", textController: fullnameController),
                const SizedBox(
                  height: 16,
                ),
                FormWidget(
                    title: "Email Address", textController: emailController),
                const SizedBox(
                  height: 16,
                ),
                FormWidget(
                    title: "Password", textController: passwordController),
                const SizedBox(
                  height: 30,
                ),
                CustomeFilledButton(
                  title: "Update Now",
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
