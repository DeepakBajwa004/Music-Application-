import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_music/config/Color.dart';
import 'package:m_music/config/image_string.dart';
import 'package:m_music/controller/songPlayerController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class SongAndVolume extends StatelessWidget {

  const SongAndVolume({super.key, });

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Obx(
      () => SfRadialGauge(
        animationDuration: 1,
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            useRangeColorForAxis: true,
            startAngle: 0,
            endAngle: 360,
            canRotateLabels: false,
            interval: 10,
            isInversed: false ,
            maximum: 1,
            minimum: 0,
            showAxisLine: true,
            showLabels: false,
            showTicks: false,
            ranges: [
              GaugeRange(
                  startValue: 0,
                  endValue: songPlayerController.volumeLable.value,
                color: primaryColor,
              ),
            ],
            pointers: [
              MarkerPointer(
                color: primaryColor,
                value: songPlayerController.volumeLable.value,
                onValueChanged: (value){
                  songPlayerController.changeVolume(value);
                },
                enableAnimation: true,
                enableDragging: true,
                markerType: MarkerType.circle,
                markerWidth: 30,
                markerHeight: 30,
              )
            ],
            annotations: [
              GaugeAnnotation(
                horizontalAlignment: GaugeAlignment.center,
                  widget: songPlayerController.isCloudPlaying.value ?
                  Container(
                    height: 280,
                    width: 280,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: divColor,
                      image: DecorationImage(
                        image: NetworkImage(songPlayerController.albumUrl.value),
                        fit: BoxFit.cover,
                      )
                    ),
                  ) :
                Container(
                    height: 280,
                    width: 280,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: divColor,
                    ),
                  child: songPlayerController.albumArtwork.value != null
                      ? Image.memory(
                    songPlayerController.albumArtwork.value!,
                    fit: BoxFit.cover,
                  )
                      : const Icon(
                    Icons.music_note,
                    size: 100,
                    color: Colors.grey,
                  ),
                  ),

              )
            ],
          )
        ],

      ),
    );
  }

}

