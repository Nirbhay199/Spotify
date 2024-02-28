import 'package:audioplayers/audioplayers.dart';
import 'package:firebase/app/ui/bottom_app_bar/view/home/modal/song.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt index = 0.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  Rx<Song?> songPlayed = Rx<Song?>(null);
  var totalDuration = const Duration().obs;
  var event = PlayerState.stopped.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAudioInfo();
  }

  getAudioInfo() {
    audioPlayer.onDurationChanged.listen((Duration event) {
      totalDuration.value = event;
    });
    audioPlayer.onPlayerStateChanged.listen((event) {
      this.event.value = event;
    });
  }

  void onTap(int index) {
    this.index.value = index;
  }

  play(Song song) {
    if (song.id == songPlayed.value?.id) {
      audioPlayer.resume();
    } else {
      audioPlayer.stop();
      songPlayed.value = song;
      audioPlayer.play(UrlSource(song.audioFile));
    }
  }

  stopMusic() {
    audioPlayer.pause();
  }

  skipMusic(position) {
    audioPlayer.seek(position);
  }
}
