import 'package:firebase/constant/color.dart';
import 'package:firebase/web/ui/add_musician/controller/musician.dart';
import 'package:firebase/widget/AppButton.dart';
import 'package:firebase/widget/textfeild.dart';
import 'package:firebase/widget/web/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMusician extends StatelessWidget {
  const AddMusician({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
      init: MusicianController(),
      builder: (musicianController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width - 500,
                padding: EdgeInsets.symmetric(horizontal: 150),
                decoration: BoxDecoration(color: spaceBlack),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: AppTextField(
                          controller: musicianController.name,
                          hintText: "Name",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: AppTextField(
                          controller: musicianController.about,
                          hintText: "About",
                          maxLine: 5,
                        ),
                      ),
                      Obx(() {
                        if (musicianController.audios.isNotEmpty) {
                          return SizedBox(
                            height: 200,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 400,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2),
                              shrinkWrap: true,
                              itemCount: musicianController.audios.length,
                              itemBuilder: (context, index) {
                                return Player(
                                  index: index,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            musicianController.addMusic();
                          },
                          backgroundColor: appColor,
                          isExtended: true,
                          child: const Icon(Icons.music_note_outlined),
                        ),
                      ),
                      AppButton(
                        buttonLabel: "Submit",
                        buttonColor: whiteColor,
                        textColor: spaceBlack,
                        onPressed: ()async{
                          await musicianController.submit();
                          // print(result);
                        },
                      )
                    ]),
              ),
            ),
            Positioned(
              left: 90,
              top: 20,
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 152,
                        child: CircleAvatar(
                            backgroundColor: spaceBlack,
                            radius: 150,
                            backgroundImage: musicianController.image.value
                                ? MemoryImage(
                                    musicianController.imagefile[0].bytes!)
                                : null),
                      )),
                  Positioned(
                    bottom: 15,
                    right: 30,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        musicianController.pickFile();
                      },
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 25,
                        child: Center(
                            child: Icon(
                          Icons.camera_alt_rounded,
                          size: 25,
                          color: spaceBlack,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        );
      },
    ));
  }
}

/**/
