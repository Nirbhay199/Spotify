import 'package:firebase/app/ui/auth/create_account/controller/artists.dart';
import 'package:firebase/app/ui/bottom_app_bar/view/home/controller/home_controller.dart';
import 'package:firebase/constant/color.dart';
import 'package:firebase/widget/artist.dart';
import 'package:firebase/widget/music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final ArtistsController artistsController;

  final HomeController homeController;
  const Home(
      {super.key,
      required this.artistsController,
      required this.homeController});

  @override
  Widget build(BuildContext context) {
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
                  return Padding(
                    padding:
                    const EdgeInsets.only(top: 60),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: greenColor,
                      ),
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
                              song: homeController.songs[index]);
                        },
                      ));
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
