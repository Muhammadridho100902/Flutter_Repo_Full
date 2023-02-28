import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class EditPin extends StatelessWidget {
  EditPin({super.key});

  final TextEditingController oldpinController = TextEditingController();
  final TextEditingController newpinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
        title: const TitleWidgets(title: "Edit Pin"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                FormWidget(
                    title: "Old Pin", textController: oldpinController),
                const SizedBox(
                  height: 16,
                ),
                FormWidget(
                    title: "New Pin", textController: newpinController),
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
