import 'package:flutter/material.dart';

import '../constant/color.dart';
class Artist extends StatelessWidget {
  final String pic;
  final String name;
  const Artist({super.key, required this.pic, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(pic),
        ),

        Text(name,
          style: TextStyle(
              color: whiteColor,
              fontSize: 10,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
