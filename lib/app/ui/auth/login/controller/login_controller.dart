import 'dart:convert';

import 'package:firebase/app/UI/auth/login/services/login.dart';
import 'package:firebase/app/storage/boxes.dart';
import 'package:firebase/app/ui/bottom_app_bar/bottom_appbar_screen.dart';
import 'package:firebase/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var color = const Color(0xff535353).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email.addListener(() {
      if (password.text != "" && email.text != "") {
        color.value = whiteColor;
      } else {
        color.value = const Color(0xff535353);
      }
    });
    password.addListener(() {
      if (password.text != "" && email.text != "") {
        color.value = whiteColor;
      } else {
        color.value = const Color(0xff535353);
      }
    });
  }

  submit() async {
    var body = jsonEncode({"email": email.text, "password": password.text});
    var result = await LoginService().login(body);
    user.put("user", result);
    if (result['success'] == false) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: spaceBlack,
        title: "Invalid Request",
        duration: const Duration(milliseconds: 900),
        message: result['message'],
      ));
    } else {
      Get.to(const BottomAppBarScreen());
    }
    print(result);
  }
}
