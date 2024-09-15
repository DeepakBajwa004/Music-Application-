import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:m_music/model/mySongModel.dart';

class CloudSongController extends GetxController{
  final dataBase = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList =RxList<MySongModel>([]);


  void uploadSongToDataBase () async {
    MySongModel newSong = MySongModel(
        id: 1,
        title: "10 Numbari - Masoom Sharma",
        artist: "Masoom Sharma ",
        album: "My Album",
        albumArt: "https://c.saavncdn.com/658/10-Numbari-Punjabi-2022-20221024115211-500x500.jpg",
        data: "https://firebasestorage.googleapis.com/v0/b/m-music-796f8.appspot.com/o/10%20Numbari%20-%20Masoom%20Sharma%20128%20Kbps.mp3?alt=media&token=d2f34007-e1c7-4332-b404-1b7bce7b956a"
    );
    await dataBase.collection("songs").add(newSong.toJson());
    print("🔥🔥🔥Upload Song Done🔥🔥🔥");
  }

}