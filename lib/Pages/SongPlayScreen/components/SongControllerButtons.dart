import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_music/config/Color.dart';
import 'package:m_music/config/Theme.dart';
import 'package:m_music/config/image_string.dart';
import 'package:m_music/controller/songDataController.dart';
import 'package:m_music/controller/songPlayerController.dart';

class SongControllerButtons extends StatelessWidget {
  const SongControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [

        Obx( ()=>
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${songPlayerController.currentTime}',style: Theme.of(context).textTheme.bodySmall,),
              Expanded(
                child: Slider(
                  value: songPlayerController.sliderValue.value
                  .clamp(0.0, songPlayerController.sliderMaxValue.value),  // sliderValue
                  onChanged: (value) {
                    songPlayerController.sliderValue.value = value;
                    Duration songPosition = Duration(seconds: value.toInt());
                    songPlayerController.changeSongSlider(songPosition);
                  },
                  min: 0,
                  max: songPlayerController.sliderMaxValue.value  ,
                ),
              ),
              Text('${songPlayerController.totalTime}',style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                songDataController.playPreviousSong();
              },
                child: SvgPicture.asset(previousIcon,color: Colors.white,width: 35,)),
            const SizedBox(width: 40,),
            Obx(()
            =>  songPlayerController.isPlaying.value ?
            InkWell(
              onTap: (){
                songPlayerController.pausePlaying();
              },
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor
                ),
                child: SvgPicture.asset(pauseIcon ,width: 20,color: Colors.white,),
              ),
            ) :
            InkWell(
              onTap: (){
                songPlayerController.resumePlaying();
              },
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor
                ),
                child: SvgPicture.asset(playIcon,width: 20,color: Colors.white,),
               ),
            ),
            ),
            const SizedBox(width: 40,),
            InkWell(
              onTap: () {
                songDataController.playNextSong();
              },
                child: SvgPicture.asset(nextIcon,color: Colors.white,width: 35,))
          ],
        ),
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){
                  songPlayerController.playRandomSong();
                },
                child: Obx(
                   () => SvgPicture.asset(
                    shuffleIcon,
                      color: songPlayerController.isShuffle.value ? primaryColor : Colors.white
                  ),
                )
            ),
            SvgPicture.asset(downloadIcon,color: Colors.white,width: 30,),
            SvgPicture.asset(heartIcon,color: Colors.white,width: 30,),
            InkWell(
              onTap: (){
                songPlayerController.setSongLoop();
              },
                child: Obx(
                    ()=> SvgPicture.asset(
                    repeatIcon,
                    color: songPlayerController.isLoop.value ? primaryColor : Colors.white
                  ),
                )
            )
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
