import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_music/controller/cloudSongController.dart';

class UploadSongOnCloud extends StatelessWidget {
  const UploadSongOnCloud({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            cloudSongController.uploadSongToDataBase();
          },
          child: const Text('Upload Song'),
        ),
      ),
    );
  }
}
