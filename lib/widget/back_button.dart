import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppBackButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? backIconColor;
  final void Function()? onTap;
  const AppBackButton(
      {super.key, this.buttonColor, this.backIconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap ?? () => Get.back(),
        child: CircleAvatar(
          backgroundColor: buttonColor,
          child: Center(
              child: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: backIconColor,
          )),
        ),
      ),
    );
  }
}
