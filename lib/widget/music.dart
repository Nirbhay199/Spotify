import 'package:firebase/app/ui/bottom_app_bar/controller/bottom_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/ui/bottom_app_bar/view/home/modal/song.dart';
import '../constant/color.dart';
class MusicAlbum extends StatelessWidget {
  final Song song;
  const MusicAlbum({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    BottomBarController barController=Get.put(BottomBarController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: ()=>barController.play(song),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(image: MemoryImage(song.image),fit: BoxFit.cover),
            ),
          ),
        ),
        Text(song.name,
          style: TextStyle(
              color: whiteColor,
              fontSize: 10,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
