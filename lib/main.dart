import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_music/Pages/HomeScreen/SongPage.dart';
import 'package:m_music/Pages/SongPlayScreen/SongPlayPage.dart';
import 'package:m_music/config/Theme.dart';

import 'Pages/SplashScreen/splash_screen.dart';
import 'Pages/uploadSongOnCloud.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      //home: const SongPage(),
      home: UploadSongOnCloud(),
    );
  }
}


