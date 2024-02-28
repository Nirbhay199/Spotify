import 'dart:io';

import 'package:dart_tags/dart_tags.dart';
import 'package:firebase/app/ui/bottom_app_bar/view/home/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../modal/song.dart';

class HomeController extends GetxController {
  var songs = <Song>[].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<int>> convertAudioLinkToUint8List(image) async {
    final url = Uri.parse(image);
    final client = HttpClient();
    final request = await client.getUrl(url);
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  getAudioImage(image) {
    final tp = TagProcessor();
    return tp
        .getTagsFromByteArray(convertAudioLinkToUint8List(image))
        .then((l) {
      Map metadata = l[1].tags;
      AttachedPicture coverArt = metadata['picture']['Cover (front)'];
      return Uint8List.fromList(coverArt.imageData);
    });
  }

  Future<bool> fetchSongs() async {
    songs.clear();
    var result = await ApiServices().fetchSongs();
    return  result['message'].forEach((song) async {
      var image = await getAudioImage(song['audio_file']);
      if (!songs.any((element) => element.id == song['_id'])) {
        songs.add(Song(
            id: song['_id'],
            audioFile: song['audio_file'],
            singerId: song['singer_id'],
            name: song['name'],
            image: image));
        return true;
      }

    });

  }
}
