import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_upload.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController();

  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpUpload(
                  data: SignUpModel(
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormWidget(
                      textController: nameController,
                      title: 'Full Name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 46.06,
                    ),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 73.7,
                    ),
                    CustomeFilledButton(
                      title: 'Continue',
                      width: double.infinity,
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else {
                          showCustomSnackBar(context, 'isi semua');
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 73.7,
                    ),
                    CustomTextWidget(
                      title: 'Sign In',
                      width: double.infinity,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/signIn', (route) => false);
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
