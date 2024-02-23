import 'package:firebase/app/storage/user.dart';
import 'package:hive/hive.dart';

late Box artiestes;
late Box user;

boxInitialized()async{
  // artiestes=await Hive.openBox<User>("artiestes");
  user=await Hive.openBox("userBox");
}