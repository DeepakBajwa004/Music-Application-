import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_music/config/Color.dart';
import 'package:m_music/config/image_string.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset(backIcon,color: Colors.white,width: 30,))
          ),
        ),
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset(settingIcon,color: Colors.white,width: 28,)),
        ),
      ],
    );
  }
}
