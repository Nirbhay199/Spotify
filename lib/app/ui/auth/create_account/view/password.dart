import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constant/color.dart';
import '../../../../../../widget/back_button.dart';
import '../../../../../../widget/textfeild.dart';
import '../controller/create_account.dart';
import 'name.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController createAccount = Get.put(AccountController());
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
              child: Text(
                "Create a password",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppTextField(
              controller: createAccount.password,
              hintText: "Zxcvbnm@1",
              top: 6,
              bottom: 3,
            ),
            Text(
              "Use atleast 8 characters.",
              style: TextStyle(fontSize: 9, color: whiteColor),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() => Center(
                  child: TextButton(
                    onPressed: () {
                      if (createAccount.password.text == "") {
                        Get.showSnackbar(GetSnackBar(
                          backgroundColor: spaceBlack,
                          title: "Enter your Password",
                          message: "Example -> Zxcvbnm@1",
                        ));
                      } else {
                        Get.to(const Name());
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: createAccount.passwordColor.value,
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
      ),
    );
  }
}
