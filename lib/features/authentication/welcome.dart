import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/authentication/login.dart';
import 'package:rider_app/features/authentication/signUp.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/widgets/primary_btn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/authWelcome.svg'),
                  const SizedBox(height: 30),
                  const Text(
                    "Welcome",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.secondary),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Have a better sharing experience",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              PrimaryBtn(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                btnText: 'Create an account',
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.primaryColor,
                textStyle: const TextStyle(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              PrimaryBtn(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                btnText: 'Log In',
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                ),
                color: AppColors.white,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
