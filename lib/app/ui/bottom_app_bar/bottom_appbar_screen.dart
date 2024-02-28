import 'package:audioplayers/audioplayers.dart';
import 'package:firebase/app/ui/auth/create_account/controller/artists.dart';
import 'package:firebase/app/ui/bottom_app_bar/controller/bottom_bar_controller.dart';
import 'package:firebase/app/ui/bottom_app_bar/view/home/controller/home_controller.dart';
import 'package:firebase/app/ui/bottom_app_bar/view/home/view/home.dart';
import 'package:firebase/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomAppBarScreen extends StatelessWidget {
  const BottomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomBarController barController = Get.put(BottomBarController());
    ArtistsController artistsController = Get.put(ArtistsController());
    HomeController homeController = Get.put(HomeController());
    List<Widget> pages = [
      Home(
          artistsController: artistsController, homeController: homeController),
      Home(
          artistsController: artistsController, homeController: homeController),
      Home(
          artistsController: artistsController, homeController: homeController),
    ];
    return Obx(() => Scaffold(
          body: pages[barController.index.value],
          bottomSheet: barController.songPlayed.value == null
              ? null
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xff550A1C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 37,
                            width: 37,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                    image: MemoryImage(
                                        barController.songPlayed.value!.image),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                barController.songPlayed.value!.name,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "BEATSPILL+",
                                style: TextStyle(
                                    color: greenColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                if (barController.event.value ==
                                    PlayerState.paused) {
                                  barController
                                      .play(barController.songPlayed.value!);
                                } else {
                                  barController.stopMusic();
                                }
                              },
                              icon: Icon(
                                barController.event.value == PlayerState.paused
                                    ? Icons.play_arrow
                                    : Icons.pause,
                                color: whiteColor,
                              ),
                              iconSize: 30)
                        ],
                      ),
                      Spacer(),
                      StreamBuilder(
                        stream: barController.audioPlayer.onPositionChanged,
                        builder: (context, snapshot) => SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 5,
                              trackShape: const RoundedRectSliderTrackShape(),
                              thumbShape: SliderComponentShape.noOverlay,
                              overlayShape: SliderComponentShape.noOverlay,
                              activeTrackColor: Colors.grey.withOpacity(.8),
                              allowedInteraction: SliderInteraction.tapAndSlide,
                              inactiveTrackColor: Colors.white54),
                          child: Slider(
                              value: snapshot.data == null
                                  ? 0
                                  : double.parse(
                                      snapshot.data!.inMilliseconds.toString()),
                              max: double.parse(barController
                                  .totalDuration.value.inMilliseconds
                                  .toString()),
                              onChanged: (_) {
                                Duration newDuration =
                                    Duration(milliseconds: _.toInt());
                                barController.skipMusic(newDuration);
                              }),
                        ),
                      )
                    ],
                  ),
                ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: barController.index.value,
              selectedItemColor: whiteColor,
              unselectedItemColor: Colors.white54,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: barController.onTap,
              backgroundColor: Colors.black,
              elevation: 2,
              unselectedFontSize: 13,
              selectedFontSize: 13,
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset("assets/icons/home_filled.svg"),
                  icon: SvgPicture.asset("assets/icons/home.svg"),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset("assets/icons/Search_filled.svg"),
                  icon: SvgPicture.asset("assets/icons/Search.svg"),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset("assets/icons/library_filled.svg"),
                  icon: SvgPicture.asset("assets/icons/library.svg"),
                  label: "Your Library",
                ),
              ]),
        ));
  }
}
