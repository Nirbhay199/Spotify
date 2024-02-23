import 'package:audioplayers/audioplayers.dart';
import 'package:firebase/constant/color.dart';
import 'package:firebase/web/ui/add_musician/controller/musician.dart';
import 'package:firebase/widget/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/format_time.dart';

class Player extends StatelessWidget {
  final int index;
  const Player({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    MusicianController musicianController = Get.put(MusicianController());
    return StreamBuilder(
        stream: musicianController.audioPlayer.onPositionChanged,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Music--$index",
                style: TextStyle(color: whiteColor),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      musicianController.event.value == PlayerState.playing &&
                              index == musicianController.musicPlay.value
                          ? musicianController.stopMusic()
                          : musicianController.playMusic(index);
                    },
                    iconSize: 50,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      musicianController.event.value == PlayerState.playing &&
                              index == musicianController.musicPlay.value
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      color: whiteColor,
                    ),
                  ),
                  Slider(
                      value: snapshot.data == null &&
                              index != musicianController.musicPlay.value
                          ? 0
                          : double.parse(
                              snapshot.data!.inMilliseconds.toString()),
                      max: double.parse(musicianController
                          .totalDuration.value.inMilliseconds
                          .toString()),
                      thumbColor: spaceBlack,
                      activeColor: spaceBlack,
                      inactiveColor: whiteColor,
                      onChanged: (_) {
                        Duration newDuration =
                            Duration(milliseconds: _.toInt());
                        musicianController.skipMusic(newDuration);
                      }),
                  index != musicianController.musicPlay.value
                      ? Text(
                          "00:00/00:00",
                          style: TextStyle(color: whiteColor),
                        )
                      : Text(
                          "${formatDuration(musicianController.totalDuration.value)}/${snapshot.data == null ? "00:00" : formatDuration(snapshot.data!)}",
                          style: TextStyle(color: whiteColor),
                        )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: musicianController.audios[index].songName,
                hintText: 'Song Name',
              ),
            ],
          );
        });
  }
}
