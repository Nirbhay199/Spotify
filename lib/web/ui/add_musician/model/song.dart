import 'dart:typed_data';
import 'package:flutter/material.dart';
class Song{
  Uint8List? bytes;
  String extension;
  String? name;
  TextEditingController songName=TextEditingController();
  Song({this.bytes,this.extension="mp4",this.name,required this.songName});
}