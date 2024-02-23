import 'package:hive/hive.dart';

class StorageHive {
  late BoxCollection collection;
  void initlize() async {
   collection = await BoxCollection.open(
      'App', // Name of your database
      {'token', 'user'}, // Names of your boxes
    );
  }
}
