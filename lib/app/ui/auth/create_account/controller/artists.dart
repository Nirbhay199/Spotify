import 'dart:async';

import 'package:firebase/app/ui/auth/create_account/modal/artist.dart';
import 'package:firebase/app/ui/auth/create_account/services/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArtistsController extends GetxController {
  var artist = <Artist>[].obs;
  final TextEditingController search = TextEditingController();
  bool _isApiCallInProgress = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search.addListener(() {
      if (!_isApiCallInProgress) {
        _isApiCallInProgress = true;
        Timer(const Duration(seconds: 1), () {
          fetchArtists();
          _isApiCallInProgress = false;
        });
      }
    });
    fetchArtists();
  }

  fetchArtists() async {
    artist.clear();
    var result = await AccountService()
        .fetchArtists(name: search.text.trim() != '' ? search.text : null);
    if (result['success']) {
      result["message"].forEach((e) {
        artist.add(Artist(
            name: e['name'],
            id: e['id'],
            about: e['about'],
            profilePic: e['prfile_pic']));
      });
    }
  }
}
