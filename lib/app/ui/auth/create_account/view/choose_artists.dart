import 'package:firebase/app/ui/auth/create_account/controller/artists.dart';
import 'package:firebase/widget/artist.dart';
import 'package:firebase/widget/textfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../../../constant/color.dart';
import '../../../../../widget/back_button.dart';

class ChooseArtists extends StatelessWidget {
  const ChooseArtists({super.key});
  @override
  Widget build(BuildContext context) {
    ArtistsController artistsController = Get.put(ArtistsController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: AppBackButton(
            buttonColor: spaceBlack,
          ),
          title: Text(
            "Choose 3 or more artists you like.",
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AppTextField(
                controller: artistsController.search,
                hintText: "search",
                fillColor: whiteColor,
                constraints: const BoxConstraints(maxHeight: 42),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Obx(
                () => Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: artistsController.artist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 20),
                      itemBuilder: (context, index) => Artist(
                          pic: artistsController.artist[index].profilePic,
                          name: artistsController.artist[index].name)),
                ),
              )
            ],
          ),
        ));
  }
}
