import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_verify.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUpload extends StatefulWidget {
  final SignUpModel data;

  SignUpUpload({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpUpload> createState() => _SignUpUploadState();
}

class _SignUpUploadState extends State<SignUpUpload> {
  TextEditingController pinController = TextEditingController();

  XFile? selectedImage;

  // bool validate() {
  //   if (pinController.text.length != 6) {
  //     return false;
  //   }
  //   return true;
  // }

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

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
            title: "Join Us to Unlock\nYour Growth",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24.56,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/upload.png"),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TitleWidgets(
                  title: "Ridho",
                  fontWeight: medium,
                  sizeText: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                FormWidget(
                  title: "Set PIN(8 digit number)",
                  textController: pinController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomeFilledButton(
                  title: 'Continue',
                  width: double.infinity,
                  onPressed: () {
                    if (pinController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Field PIN harus diisi',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupVerify(
                            data: widget.data.copyWith(
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                              pin: pinController.text,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
