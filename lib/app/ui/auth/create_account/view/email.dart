import 'package:firebase/app/UI/auth/create_account/view/password.dart';
import '../../../../../../constant/color.dart';
import '../../../../../../widget/back_button.dart';
import '../../../../../../widget/textfeild.dart';
import '../controller/create_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController createAccount = Get.put(AccountController());
    // GlobalKey<FormState> _key=GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: AppBackButton(
          buttonColor: spaceBlack,
          onTap: () {
            Get.back();
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Create account",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: /*Form(
        key: _key,
        child:*/
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
              child: Text(
                "What’s your email?",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppTextField(
              controller: createAccount.email,
              hintText: "abc@gmail.com",
              top: 6,
              bottom: 3,
            ),
            Text(
              "You’ll need to confirm this email later.",
              style: TextStyle(fontSize: 9, color: whiteColor),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() => Center(
                  child: TextButton(
                    onPressed: () {
                      RegExp regExp =
                          RegExp(r'^[a-zA-Z0-9._%+-]+@(?:gmail|yopmail)\.com$');
                      if (createAccount.email.text == "") {
                        Get.showSnackbar(GetSnackBar(
                          backgroundColor: spaceBlack,
                          duration: const Duration(milliseconds: 900),
                          title: "Enter your Email",
                          message: "Example -> abc@gmail.com",
                        ));
                      } else {
                        if (regExp.hasMatch(createAccount.email.text)) {
                          Get.to(const Password());
                        } else {
                          Get.showSnackbar(GetSnackBar(
                            backgroundColor: spaceBlack,
                            duration: const Duration(milliseconds: 900),
                            title: "Enter Valid Email",
                            message: "Example -> abc@gmail.com",
                          ));
                        }
                      }
                      /*   _key.currentState!.save();
                    if(_key.currentState!.validate()) {

                    }     */
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: createAccount.emailColor.value,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        fixedSize: const Size(82, 42)),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ))
          ],
        ),
        // ),
      ),
    );
  }
}
