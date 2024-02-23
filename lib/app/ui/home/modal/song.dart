import 'dart:typed_data';

class Song {
  final int id;
  final int singer_id;
  final String song_name;
  final String audio_file;
  final Uint8List image;
  Song({
    required this.id,
    required this.audio_file,
    required this.singer_id,
    required this.song_name,
    required this.image,
  });
}
