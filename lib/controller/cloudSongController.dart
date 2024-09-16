import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:m_music/model/mySongModel.dart';

class CloudSongController extends GetxController{
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList =RxList<MySongModel>([]);
  RxList<MySongModel> trendingSongList =RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSong();
    super.onInit();
  }

  void uploadSongToDataBase () async {
    MySongModel newSong = MySongModel(
        id: 1,
        title: "Badnam Gabru - Masoom Sharma",
        artist: "Masoom Sharma",
        album: "album",
        albumArt: "https://c.saavncdn.com/069/Badnam-Gabru-Haryanvi-2021-20210218144354-500x500.jpg",
        data: "https://firebasestorage.googleapis.com/v0/b/m-music-796f8.appspot.com/o/Badnam%20Gabru%20-%20Masoom%20Sharma%20128%20Kbps.mp3?alt=media&token=97775ae9-ca09-42e4-8d99-c84a38968531"
    );
    MySongModel(
        id: 1,
        title: "Chand - Masoom Sharma",
        artist: "Masoom Sharma",
        album: "album",
        albumArt: "https://c.saavncdn.com/542/Chand-Haryanvi-2022-20211224132324-500x500.jpg",
        data: "https://firebasestorage.googleapis.com/v0/b/m-music-796f8.appspot.com/o/Chand%20-%20Masoom%20Sharma%20128%20Kbps.mp3?alt=media&token=80d9e216-dfab-488b-bc52-bcacd689a343"
    );
    MySongModel(
        id: 1,
        title: "Up To U - Dhanda Nyoliwala",
        artist: "Dhanda Nyoliwala",
        album: "album",
        albumArt: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEALekRsq-va_c3RqEQ2O0ya5zopvEgq2_gA&s",
        data: "https://firebasestorage.googleapis.com/v0/b/m-music-796f8.appspot.com/o/Up%20To%20U%20-%20Dhanda%20Nyoliwala%20128%20Kbps.mp3?alt=media&token=22414ad0-244f-4bb1-a5d1-0f2b299ea513"
    );
    MySongModel(
        id: 1,
        title: "Jap Naam Bhole Ka - Masoom Sharma",
        artist: "Masoom Sharma",
        album: "album",
        albumArt: "https://c.saavncdn.com/535/Jap-Naam-Bhole-Ka-Haryanvi-2021-20210401103957-500x500.jpg",
        data: "https://firebasestorage.googleapis.com/v0/b/m-music-796f8.appspot.com/o/Jap%20Naam%20Bhole%20Ka%20-%20Masoom%20Sharma%20128%20Kbps.mp3?alt=media&token=4faa611a-836a-475d-ac28-e1bdacf2be5b"
    );
    try {
      await db.collection("songs").add(newSong.toJson());
      print("🔥🔥🔥 Upload Song Done 🔥🔥🔥");
    } catch (e) {
      print("❌ Error uploading song: $e");
    }
  }


  void getCloudSong () async {
    cloudSongList.clear();
    await db.collection("trending").get().then((value){
      value.docs.forEach((element){
        trendingSongList.add(MySongModel.fromJson(element.data()));
      });
      print("Trending Song Length ${trendingSongList.length}");
    });
    await db.collection("songs").get().then((value){
      value.docs.forEach((element){
        cloudSongList.add(MySongModel.fromJson(element.data()));
      });
      print('Cloud Song Length ${cloudSongList.length}');
    });

  }




}