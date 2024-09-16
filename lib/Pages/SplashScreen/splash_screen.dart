import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_music/Pages/HomeScreen/SongPage.dart';
import 'package:m_music/Pages/HomeScreen/components/trendingSongSlider.dart';
import 'package:m_music/config/image_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), (){
      Get.to(()=> const SongPage());

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset(splashLogo,width: 220,),
      ),
    );
  }
}
