import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/ui/pages/edit_pin.dart';
import 'package:bank_sha/ui/pages/edit_profile.dart';
import 'package:bank_sha/ui/pages/home.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_success.dart';
import 'package:bank_sha/ui/pages/top_up_page.dart';
import 'package:bank_sha/ui/pages/top_up_succsess.dart';
import 'package:bank_sha/ui/pages/total_amount.dart';
import 'package:bank_sha/ui/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: "Banking",
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SignUpScreen(),
          '/onBoarding': (context) => const OnboardingScreen(),
          '/signIn': (context) => SiginScrenn(),
          '/signUp': (context) => const SignUpScreen(),
          '/signUpSuccess': (context) => const SignupSuccess(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/editProfile': (context) => EditProfile(),
          '/editPin': (context) => EditPin(),
          '/topUp': (context) => const TopUpPage(),
          '/pin': (context) => const PinPage(),
          '/totalAmount': (context) => const TotalAmount(),
          '/topUpSuccess': (context) => const TopUpSuccess(),
          '/tranfer': (context) => TransferPage(),
        },
      ),
    );
  }
}
