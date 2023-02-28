import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignupVerify extends StatefulWidget {
  final SignUpModel data;

  const SignupVerify({Key? key, required this.data}) : super(key: key);

  @override
  State<SignupVerify> createState() => _SignupVerifyState();
}

class _SignupVerifyState extends State<SignupVerify> {
  XFile? selectedImage;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView(
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
                title: "Verify Your\nAccount",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24.56,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                      title: "Passport/ID Card",
                      fontWeight: medium,
                      sizeText: 18,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomeFilledButton(
                      title: 'Continue',
                      width: double.infinity,
                      onPressed: () {
                        if (selectedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Gambar tidak boleh kosong',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                    ktp: 'data:image/png;base64,' +
                                        base64Encode(File(selectedImage!.path)
                                            .readAsBytesSync()),
                                  ),
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextWidget(
                title: "Skip for Now",
                width: double.infinity,
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthRegister(widget.data),
                      );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
