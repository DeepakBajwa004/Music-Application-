import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:m_music/config/image_string.dart';

class SongHeader extends StatelessWidget {
  const SongHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(mainLogo,width: 50,),
        const SizedBox(width: 10,),
        const Text('M Music',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            fontStyle: FontStyle.italic
          ),
        ),
      ],
    );
  }
}
