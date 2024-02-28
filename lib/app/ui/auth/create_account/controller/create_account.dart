import 'dart:convert';

import 'package:firebase/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../storage/boxes.dart';
import '../services/create_account.dart';
import '../view/choose_artists.dart';



class AccountController extends GetxController{

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var nameColor = const Color(0xff535353).obs, emailColor = const Color(0xff535353).obs, passwordColor = const Color(0xff535353).obs;

  @override
  onInit(){
    super.onInit();
    name.addListener(() {
    if(name.text==""){
      nameColor.value = const Color(0xff535353);
    }else{
      nameColor.value = whiteColor;
    }
    });
    email.addListener(() {
      if(email.text==""){
        emailColor.value = const Color(0xff535353);
      }else{
        emailColor.value = whiteColor;
      }
    });
    password.addListener(() {
      if(password.text==""){
        passwordColor.value = const Color(0xff535353);
      }else{
        passwordColor.value = whiteColor;
      }
    });
  }


  submit() async {
    var body = jsonEncode({
      "name": name.text,
      "email": email.text,
      "password": password.text
    });
    var result = await AccountService().createAccount(body);
    if(result['success']){
      user.put("user",result);
      Get.showSnackbar(GetSnackBar(
        backgroundColor: spaceBlack,
        title: "Account Create",
        duration: const Duration(milliseconds: 900),
        message: "Account Created",
      ));
      Get.to(const ChooseArtists());
    }else{
      Get.showSnackbar(GetSnackBar(
        backgroundColor: spaceBlack,
        title: "Invalid Request",
        duration: const Duration(milliseconds: 900),
        message: result['message'],
      ));
    }
  }





}