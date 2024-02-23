import '../../../../../../constant/color.dart';
import '../../../../../../widget/AppButton.dart';
import '../../../../../../widget/back_button.dart';
import '../../../../../../widget/textfeild.dart';
import '../controller/create_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController createAccount = Get.put(AccountController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: AppBackButton(
          buttonColor: spaceBlack,
          onTap: (){
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
                "What’s your name?",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppTextField(
              controller: createAccount.name,
              hintText: "John Max",
              top: 6,
              bottom: 3,
            ),
            Text(
              "This appears on your spotify profile",
              style: TextStyle(fontSize: 9, color: whiteColor),
            ),
            const SizedBox(
              height: 50,
            ),
            const Spacer(),
           Obx(() =>  Center(
               child: AppButton(
                 buttonLabel: "Create an account",
                 onPressed: ()=>createAccount.submit(),
                 buttonColor: createAccount.nameColor.value,
                 width: 179,height: 42,bottom: 30,
                 textColor: Colors.black,
               )))
          ],
        ),
      ),
    );
  }
}
