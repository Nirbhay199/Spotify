import 'package:firebase/app/UI/auth/login/controller/login_controller.dart';
import 'package:firebase/app/ui/auth/create_account/view/choose_artists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../constant/color.dart';
import '../../../../../../widget/AppButton.dart';
import '../../../../../../widget/back_button.dart';
import '../../../../../../widget/textfeild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: AppBackButton(
          buttonColor: spaceBlack,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
              child: Text(
                "What’s your email?",
                style: TextStyle(
                    color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            AppTextField(
              controller: loginController.email,
              hintText: "Email",
              top: 6,
              bottom: 3,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
              child: Text(
                "Password?",
                style: TextStyle(
                    color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            AppTextField(
              controller: loginController.password,
              hintText: "Password",
              top: 6,
              bottom: 3,
            ),
            Obx(() => Center(
                    child: AppButton(
                  buttonLabel: "Login",
                  top: 90,
                  onPressed: () {
                    if (loginController.email.text == '') {
                      Get.showSnackbar(GetSnackBar(
                        backgroundColor: spaceBlack,
                        duration: const Duration(milliseconds: 900),
                        title: "Enter your Email",
                        message: "Example -> abc@gmail.com",
                      ));
                    } else if (loginController.password.text == '') {
                      Get.showSnackbar(GetSnackBar(
                        backgroundColor: spaceBlack,
                        title: "Enter your Password",
                        duration: const Duration(milliseconds: 900),
                        message: "Example -> Zxcvbnm@1",
                      ));
                    } else {
                      loginController.submit();
                    }
                  },
                  buttonColor: loginController.color.value,
                  width: 179,
                  height: 42,
                  bottom: 30,
                  textColor: Colors.black,
                )))
          ]),
        ),
      ),
    );
  }
}
