import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_music/config/Color.dart';
import '../../../config/image_string.dart';


class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderItem = [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                trendingSongImage ,
              ),
            fit: BoxFit.cover
          ),
          color: divColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  children: [

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: divColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              // SvgPicture.asset(Icon Logo),
                              const Icon(Icons.music_note),
                              const SizedBox(width: 10,),
                              Text('Trending',style: Theme.of(context).textTheme.labelLarge,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jannat' , style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal
                        ),)
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('B PRAAK' , style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: labelColor
                        ),)
                      ],
                    ),

                  ],
                )
            ),
          ],
        ),
      )
    ];
    return CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          height: 320,
          viewportFraction: 1 ,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6 ),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index , value ){},
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
