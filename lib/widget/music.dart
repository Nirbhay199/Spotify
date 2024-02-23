import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
class MusicAlbum extends StatelessWidget {
  final Uint8List pic;
  final String name;
  const MusicAlbum({super.key, required this.pic, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(image: MemoryImage(pic),fit: BoxFit.cover),
          ),
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
