import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:m_music/controller/songDataController.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {

  final player = AudioPlayer();
  final OnAudioQuery audioQuery = OnAudioQuery();

  RxBool isPlaying = false.obs;
  RxString currentTime = '0'.obs;
  RxString  totalTime = '0'.obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = ''.obs;
  RxString songArtist = ''.obs;
  RxBool isLoop = false.obs;
  RxBool isShuffle = false.obs;
  RxDouble volumeLable = 0.2.obs;
  Rxn<Uint8List> albumArtwork = Rxn<Uint8List>(); // Store album artwork


  // Play song from local storage
  void playLocalAudio( SongModel song ) async {
    songTitle.value  = song.title;
    songArtist.value = song.artist!;

    // Set audio source
    await player.setAudioSource(
      AudioSource.uri(Uri.parse(song.data)),
    );

    // Query for the album artwork
    albumArtwork.value = await audioQuery.queryArtwork(
      song.id,
      ArtworkType.AUDIO,
    );




    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void changeVolume (double volume) {
    volumeLable.value = volume;
    player.setVolume(volumeLable.value);
    print(volumeLable);
  }

  // Toggle song looping
  void setSongLoop () async {
    if(isLoop.value){
      await player.setLoopMode(LoopMode.off);
      if (kDebugMode) { print('-----------Loop Mode Exit');}
    } else {
      await player.setLoopMode(LoopMode.one);
      if (kDebugMode) { print('-----------Loop Mode On');}
    }
    isLoop.value = !isLoop.value;
  }

  // Random Song Play Shuffle
  void playRandomSong() async {
    if (isShuffle.value) {
      await player.setShuffleModeEnabled(false);
      if (kDebugMode) { print('------ -----Shuffle Mode Exit');}
    } else {
      await player.setShuffleModeEnabled(true);
      if (kDebugMode) { print('-----------Shuffle Mode On');}
    }
    isShuffle.value = !isShuffle.value;
  }


  // Resume song playback
  void resumePlaying () async {
    isPlaying.value = true;
    await player.play();
  }

  // Pause song playback
  void pausePlaying () async {
    isPlaying.value = false;
    await player.pause();
  }

  // Seek song to specific position
  void changeSongSlider (Duration position) async {
    player.seek(position);
  }

  // Update song position and duration
  void updatePosition () async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxValue.value = d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p){
        currentTime.value = p.toString().split(".")[0];
        sliderValue.value = p.inSeconds.toDouble();
        if ( totalTime.value == currentTime.value){
          isPlaying.value = false;
        }
      });
      player.playerStateStream.listen((s){
        if(player.processingState == ProcessingState.completed){
          Get.find<SongDataController>().playNextSong();
        }
      });
    } catch(e){
      print(e);
    }
  }
}

