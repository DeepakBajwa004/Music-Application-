import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_music/config/Color.dart';
import 'package:m_music/config/image_string.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../controller/songDataController.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key, required this.songName, required this.onPress});

  @override
  Widget build(BuildContext context) {
   SongDataController songDataController = Get.put(SongDataController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: divColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)
          ),
          child:  Row(
            children: [
              SvgPicture.asset(playIcon,width: 30,color: fontColor,),
              const SizedBox(width: 10,),
              Flexible(child: Text(songName,maxLines: 1,style: Theme.of(context).textTheme.bodyMedium,)),

            ],
          ),
        ),
      ),
    );
  }
}

