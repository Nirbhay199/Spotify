import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dart_tags/dart_tags.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase/web/services/api_handler.dart';
import 'package:firebase/web/ui/add_musician/model/song.dart';
import 'package:firebase/web/ui/add_musician/services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/color.dart';

class MusicianController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController about = TextEditingController();
  var imagefile = <PlatformFile>[].obs;
  // var audiobytes = Uint8List(0).obs;
  var audios = <Song>[].obs;
  var musicPlay = 9999999.obs;
  var image = false.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  var totalDuration = Duration().obs;
  var event = PlayerState.stopped.obs;
  @override
  void onInit() {
    super.onInit();
    getAudioInfo();
  }

  @override
  void onClose() {
    super.onClose();
    audioPlayer.dispose();
  }

  getAudioInfo() {
    audioPlayer.onDurationChanged.listen((Duration event) {
      totalDuration.value = event;
    });
    audioPlayer.onPlayerStateChanged.listen((event) {
      this.event.value = event;
    });
  }

  pickFile() async {
    FilePickerResult? result =
        await FilePickerWeb.platform.pickFiles(type: FileType.image);
    if (result.isBlank == false) {
      imagefile.add(result!.files[0]);
      image.value = true;
    }
  }
  Future<List<int>>? a(file)async=>file.bytes!.toList();




  addMusic() async {
    final tp = new TagProcessor();
    FilePickerResult? result = await FilePickerWeb.platform
        .pickFiles(type: FileType.audio, allowMultiple: true);
    if (result.isBlank == false) {
      for (var file in result!.files) {
        print(file.name);
        audios.add(Song(
            bytes: file.bytes!, extension: file.extension!, name: file.name,songName: TextEditingController(text: file.name)));
        tp.getTagsFromByteArray(a(file)).then((l) => l.forEach((f) => print(f)));
      }
    }
  }

  UrlSource urlSourceFromBytes(Uint8List bytes,
      {String mimeType = "audio/mpeg"}) {
    return UrlSource(Uri.dataFromBytes(bytes, mimeType: mimeType).toString());
  }

  playMusic(index) {
    if (index != musicPlay.value) {
      audioPlayer.stop();
      musicPlay.value = index;
      audioPlayer.play(urlSourceFromBytes(audios[index].bytes!),
          mode: PlayerMode.mediaPlayer);
    } else {
      audioPlayer.resume();
    }
  }

  stopMusic() {
    audioPlayer.pause();
  }

  skipMusic(position) {
    print(position);
    audioPlayer.seek(position);
  }

  submit() async {
    List songs = [];
    var result = await ApiHandler().uploadMultiple("image", imagefile);
    if(audios.isNotEmpty){
      var result2 =
      await ApiHandler().uploadMultiple("audio", audios, songNames: audios);
      List music = result2.split(',');

      for (int i = 0; i < audios.length; i++) {
        songs.add({"songName": audios[i].songName.text, "audio": music[i]});
      }
    }
    List image = result.split(',');

    var body = {
      "name": name.text,
      "about": about.text,
      "profile_pic": image[0],
      "music": songs
    };
    var response=await AddMusicianServices().submit(body);

    Get.showSnackbar(GetSnackBar(
      backgroundColor: spaceBlack,
      title: "Request Complete",
      duration: const Duration(milliseconds: 1200),
      message: response['message'],
    ));
    return true;
  }
/*
  Future<String> upload(type, bytes, name, ext) async {
    print(type);
    print(name);
    print(ext);
    var formData = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8000/upload_multi'));

    // Append the image data as a part named 'file' to the FormData
    for(int i=0; i<5;i++){
      formData.files.add(
        http.MultipartFile.fromBytes(
          'files',
          bytes,
          filename: name,
          contentType: MediaType(type, ext ?? 'jpeg'),
        ),
      );
    }

    // Send the request
    var response = await formData.send();

    // Handle the response
    if (response.statusCode == 200) {
      // If the request is successful, parse the response
      var responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);
      return jsonData['path'];
    } else {
      // If the request fails, print the error message
      print('Failed to upload image. Status code: ${response.statusCode}');
      return "Failed";
    }
  }*/

}
