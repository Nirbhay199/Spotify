import 'package:firebase/app/UI/auth/login/view/login.dart';
 import 'package:firebase/widget/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constant/color.dart';
import '../create_account/view/email.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset("assets/img/img.png"),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 25),
            child: Text('''Millions of Songs.
Free on Spotify.''',
                style: TextStyle(color: whiteColor, fontSize: 28,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          AppButton(
            buttonLabel: "Sign up free",
            onPressed: () {
              Get.to(const Email());
            },
            buttonColor: greenColor,
            textColor: Colors.black,
          ),
          AppButton(
            buttonLabel: "Continue with Google",
            textColor: whiteColor,
            side: BorderSide(color: whiteColor),
            top: 12,
          ),
          AppButton(
            buttonLabel: "Continue with Facebook",
            textColor: whiteColor,
            side: BorderSide(color: whiteColor),
            top: 12,
          ),
          AppButton(
            buttonLabel: "Continue with Apple",
            textColor: whiteColor,
            side: BorderSide(color: whiteColor),
            top: 12,
          ),
          TextButton(
              onPressed: () {
                Get.to(const LoginScreen());
              },
              child: Text(
                "Log in",
                style: TextStyle(color: whiteColor),
              )),
        ]),
      ),
    );
  }
}
