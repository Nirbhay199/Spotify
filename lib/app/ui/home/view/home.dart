import 'dart:typed_data';

import 'package:firebase/app/ui/home/controller/home_controller.dart';
import 'package:firebase/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widget/artist.dart';
import '../../../../widget/music.dart';
import '../../auth/create_account/controller/artists.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ArtistsController artistsController = Get.put(ArtistsController());
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(
          "Recently played",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.notifications_none_rounded,
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(
              Icons.restore,
              color: whiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.settings_outlined,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 125,
                child: Obx(
                  () => ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: artistsController.artist.length,
                      itemExtent: 90,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Artist(
                          pic: artistsController.artist[index].profilePic,
                          name: artistsController.artist[index].name)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 10),
              child: Text(
                "Songs You May Like",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
            FutureBuilder(
              future: homeController.fetchSongs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: greenColor,
                    ),
                  );
                } else {
                  return Obx(() => GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeController.songs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: .8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 150),
                        itemBuilder: (context, index) {
                          return MusicAlbum(
                              pic: homeController.songs[index].image,
                              name: homeController.songs[index].song_name);
                        },
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
