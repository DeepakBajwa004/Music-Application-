import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_music/controller/songDataController.dart';
import 'package:m_music/controller/songPlayerController.dart';

import '../../config/Color.dart';
import '../../config/image_string.dart';
import '../SongPlayScreen/SongPlayPage.dart';
import 'components/songHeader.dart';
import 'components/songTile.dart';
import 'components/trendingSongSlider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const SongHeader(),
                const SizedBox(height: 20,),
                const TrendingSongSlider(),
                const SizedBox(height: 20,),
                Obx( ()=>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            songDataController.isDeviceSong.value = false;
                          },
                          child: Text('Cloud Song',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: songDataController.isDeviceSong.value? labelColor : primaryColor
                          ),)),
                      InkWell(
                        onTap: (){
                          songDataController.isDeviceSong.value = true;
                        },
                          child: Text('Device Song',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: songDataController.isDeviceSong.value?primaryColor : labelColor
                          ),)),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),

                Obx(()=>
                songDataController.isDeviceSong.value ?
                 Column(
                  children: songDataController.localSongList.value
                      .map((e)=> SongTile(
                    songName: e.title,
                    onPress: (){
                      print(e.album!);
                      songPlayerController.playLocalAudio(e);
                      songDataController.findCurrentSongPlayingIndex(e.id);
                      Get.to(()=> SongPlayPage(
                      ));
                    }
                  )).toList()
                ) :
                const Column(
                  children: [

                  ],
                )),

              ],
            ),
          ),
        ),
      )
    );
  }
}
