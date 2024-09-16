import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_music/controller/songPlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SongDataController extends GetxController {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  final audioQuery = OnAudioQuery();
  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    requestStoragePermissions();
  }

  void getLocalSongs () async {
    localSongList.value = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL
    );
    if (kDebugMode) {
      print(" Local Song Length${localSongList.length}");
    }
  }

  Future<void> requestStoragePermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Storage permission granted for devices below Android 13
      if (kDebugMode) { print('--------------Permission granted'); }
      getLocalSongs();
    } else {
      if (kDebugMode) { print('--------------Permission denied'); }
      await Permission.storage.request();
    }

    // For Android 13+ permissions
    if (await Permission.photos.request().isGranted &&
        await Permission.videos.request().isGranted &&
        await Permission.audio.request().isGranted) {
      // Permissions for images, videos, and audio granted
      if (kDebugMode) { print('--------------Permission granted'); }
      getLocalSongs();
    } else {
      if (kDebugMode) { print('--------------Permission denied'); }
      await Permission.storage.request();
    }
   }


  void storagePermission () async {
    try {
       var permission = await Permission.storage.request();
       if (permission.isGranted){
         if (kDebugMode) { print('--------------Permission granted'); }
         getLocalSongs();
       } else {
         if (kDebugMode) { print('--------------Permission denied'); }
         await Permission.storage.request();
       }
    } catch (e) {
      if (kDebugMode) { print(e); }
    }
  }

  void findCurrentSongPlayingIndex (int songID) async {

    var index= 0;
    localSongList.forEach((e){
      if (e.id==songID) {
        currentSongPlayingIndex.value = index;
      }
      index++;
    });
    if (kDebugMode) { print('id  $songID'); }
    if (kDebugMode) { print('index  $currentSongPlayingIndex'); }
  }

  void playNextSong () {
    int songListLength = localSongList.length;
    currentSongPlayingIndex.value =currentSongPlayingIndex.value+1;
    if (currentSongPlayingIndex.value <  songListLength){
      SongModel nextSong = localSongList[currentSongPlayingIndex.value];
      songPlayerController.playLocalAudio(nextSong);
    }
  }

  void playPreviousSong () {
    int songListLength = localSongList.length;
    if ( currentSongPlayingIndex.value!=0){
      currentSongPlayingIndex.value = --currentSongPlayingIndex.value;
      if (currentSongPlayingIndex.value <  songListLength){
        SongModel nextSong = localSongList[currentSongPlayingIndex.value];
        songPlayerController.playLocalAudio(nextSong);
      }
    }
  }
}