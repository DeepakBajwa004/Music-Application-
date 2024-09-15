import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_music/config/Color.dart';
import 'package:m_music/config/image_string.dart';

import 'components/HeaderButton.dart';
import 'components/SongAndVolume.dart';
import 'components/SongControllerButtons.dart';
import 'components/SongDetails.dart';

class SongPlayPage extends StatelessWidget {

  const SongPlayPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
             children: [
               SizedBox(height: 10,),
               // Headers
               HeaderButton(),
               SizedBox(height: 20,),
               // Song Image And Volume-Up And Down
               SongAndVolume(),
               SizedBox(height: 20,),
               // Song Plays , Name , Artist Name
               SongDetails(

               ),
               SizedBox(height: 10,),
               Spacer(),
               // Song Bottom Controller
               SongControllerButtons(),

             ],
          ),
        ),
      ),
    );
  }
}
