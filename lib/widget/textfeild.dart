import 'package:flutter/material.dart';

import '../../constant/color.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double horizontal, top, bottom;
  final int maxLine;
  final Color fillColor;
  final bool filled;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  const AppTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.horizontal = 0.0,
      this.top = 0.0,
      this.bottom = 0.0,
      this.maxLine = 1,
      this.fillColor = const Color(0xff777777),
      this.filled = true,
      this.constraints,
      this.contentPadding,
      this.hintStyle,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, top, horizontal, bottom),
      child: TextFormField(
        controller: controller,
        cursorColor: spaceBlack,
        maxLines: maxLine,
        style: hintStyle ??TextStyle(color: spaceBlack, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            constraints: constraints,
            contentPadding: contentPadding,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            fillColor: fillColor,
            filled: filled,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(color: spaceBlack, fontWeight: FontWeight.w600),
            prefixIcon: prefixIcon),
        // validator: (value) {
        //   if(value==""){
        //     return "Enter your $hintText";
        //   }else{
        //     return null;
        //   }
        // },
      ),
    );
  }
}
