import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Color.dart';
import '../../../controller/cloudSongController.dart';
import '../../../controller/songDataController.dart';
import '../../../controller/songPlayerController.dart';
import '../../SongPlayScreen/SongPlayPage.dart';

class TrendingSongSlider extends StatelessWidget {
  TrendingSongSlider({super.key});

  final SongDataController songDataController = Get.find();
  final SongPlayerController songPlayerController = Get.find();
  final CloudSongController cloudSongController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cloudSongController.trendingSongList.isEmpty) {
        return const Center(child: CircularProgressIndicator(color: primaryColor,));
      }

      List<Widget> sliderItem = cloudSongController.trendingSongList.value.map((e) =>
          InkWell(
            onTap: () {
              songPlayerController.playCloudAudio(e);
              songDataController.findCurrentSongPlayingIndex(e.id!);
              Get.to(() => const SongPlayPage());
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(e.albumArt!),
                  fit: BoxFit.cover,
                ),
                color: divColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: divColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.music_note),
                            const SizedBox(width: 10),
                            Text(
                              'Trending',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          e.title!,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.artist!,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: labelColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ).toList();

      return CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          height: 290,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
