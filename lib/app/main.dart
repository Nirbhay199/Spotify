
import 'package:firebase/app/storage/boxes.dart';
import 'package:firebase/app/storage/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constant/color.dart';
import 'UI/auth/login/onboard_screen.dart';
void main() async{
 await  Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await boxInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  print(user.get("user"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        fontFamily: "AvenirNext",
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        useMaterial3: false
      ),

      home:Overlay(initialEntries: [
        OverlayEntry(builder: (context) => const OnBoardScreen(),)
      ],)
    );
  }
}



