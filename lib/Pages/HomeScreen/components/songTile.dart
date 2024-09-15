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


 //
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../../config/Color.dart';
// import '../../../config/image_string.dart';
//
// class SongTile extends StatefulWidget {
//   const SongTile({super.key});
//
//   @override
//   State<SongTile> createState() => _SongTileState();
// }
//
// class _SongTileState extends State<SongTile> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     requestPermission();
//   }
//
//   void requestPermission () {
//     Permission.storage.request();
//   }
//
//   final _audioQuery = OnAudioQuery();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<SongModel>>(
//       future: _audioQuery.querySongs(
//         sortType: null,
//         orderType: OrderType.ASC_OR_SMALLER,
//         uriType: UriType.EXTERNAL,
//         ignoreCase: true
//       ),
//       builder: (context , item ) {
//         if ( item.data== null){
//           print(item.data?.length);
//           return const Center(child: CircularProgressIndicator(),);
//         }
//         if ( item.data!.isEmpty){
//           return Center(child: Text('No Song Found'),);
//         }
//         return  ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: item.data!.length,
//             itemBuilder: (context , index ) {
//               return  Container(
//                 margin: const EdgeInsets.only(bottom: 20),
//                 child: ListTile(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)
//                   ),
//                  tileColor: divColor.withOpacity(0.7),
//                   leading:  SvgPicture.asset(playIcon,width: 30,color: fontColor,) ,
//                   title: Text(item.data![index].displayNameWOExt,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,),
//                   subtitle: Text(
//                     formatDuration(item.data![index].duration),
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ),
//               );
//             }
//         );
//       },
//     );
//   }
//
//   // Helper function to format the song duration
//   String formatDuration(int? duration) {
//     if (duration == null || duration == 0) return "Unknown";
//     int minutes = (duration / 1000 / 60).floor();
//     int seconds = ((duration / 1000) % 60).floor();
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }
// }

