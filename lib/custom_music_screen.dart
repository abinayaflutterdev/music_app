import 'package:flutter/material.dart';
import 'music_model_class.dart';
import 'package:sizer/sizer.dart';

class CustomMusicScreen extends StatelessWidget {

  final Music music;
  final bool playingButton;
  final VoidCallback ofPause;
  final VoidCallback onTap;

  const CustomMusicScreen({
    super.key,
    required this.music,
    required this.ofPause,
    required this.playingButton,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child:
      Card(
      color: Colors. white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0.sh)),
      margin: EdgeInsets.symmetric(
          vertical: 1.0.h,
          horizontal: 5.0.w,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(4.0.sh),
              child:
          Image.asset(
            music.image,
            height: 8.0.h,
            width: 8.0.w,
          ),),
          SizedBox(width: 5.0.w,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(music.songName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 2.0.sh,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 0.5.h,),
                  Text(music.artistName,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize:  1.5.sh
                  ),),
                ],
              )),
          IconButton(
              onPressed: ofPause,
              icon: Icon(
                  playingButton
                    ? Icons.pause
                      : Icons.play_arrow,
                size: 3.0.sh,
                color: Colors.black,

              ))

        ],
      ),
    ));
  }
}
