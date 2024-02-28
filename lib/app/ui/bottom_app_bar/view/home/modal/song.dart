import 'dart:typed_data';

class Song {
  final String id;
  final String singerId;
  final String name;
  final String audioFile;
  final Uint8List image;
  Song({
    required this.id,
    required this.audioFile,
    required this.singerId,
    required this.name,
    required this.image,
  });
}
