import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_music/controller/songPlayerController.dart';

import '../../../config/Color.dart';
import '../../../config/image_string.dart';

class SongDetails extends StatelessWidget {


  const SongDetails({super.key, });

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        // Row(
        //   children: [
        //     SvgPicture.asset(playOutlineIcon,color: labelColor,width: 30,),
        //     const SizedBox(width:5,),
        //     Text('123 Plays',style: Theme.of(context).textTheme.bodySmall,)
        //   ],
        // ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Obx(()=> Text('${songPlayerController.songTitle.value}',maxLines: 2,style: Theme.of(context).textTheme.bodyLarge,))),
            SvgPicture.asset(heartIcon,color: Colors.white,width: 30,),
          ],
        ),
        const SizedBox(height: 10,),
        Obx( ()=>
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${songPlayerController.songArtist.value}',style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ],
    );
  }
}
