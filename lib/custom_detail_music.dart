import 'package:flutter/material.dart';
import 'music_data.dart';
import 'music_model_class.dart';
import 'package:sizer/sizer.dart';

class CustomDetailMusic extends StatelessWidget {

  final Music music;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Duration duration;
  final Duration position;
  final ValueChanged<double> onSliderChanged;

  const CustomDetailMusic({
    super.key,
    required this.music,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
    required this.position,
    required this.duration,
    required this.onSliderChanged,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(music.image,
          height: 40.0.h,
          width: 80.0.w,),
          borderRadius: BorderRadius.circular(3.0.sh,),
    ),
        SizedBox(height: 2.0.h,),
        Text(music.songName,
        style: TextStyle(
          fontSize: 2.5.sh,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 1.0.sh,),
        Text(music.artistName,
        style: TextStyle(
          fontSize: 1.8.sh,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade800
        ),),
        SizedBox(height: 2.0.sh,),
        Slider(
          value: position.inMilliseconds.toDouble().clamp(
            0.0,
            duration.inMilliseconds.toDouble(),
          ),

          min: 0,

          max: duration.inMilliseconds > 0
              ? duration.inMilliseconds.toDouble()
              : 1.0,

          onChanged: duration.inMilliseconds > 0
              ? onSliderChanged
              : null,
        ),
        SizedBox(height: 2.0.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPrevious,
              icon: Icon(Icons.skip_previous,
                size: 5.0.sh,),
            ),
            SizedBox(width: 2.0.w,),
            IconButton(
              onPressed: onPlayPause,
              icon: Icon(isPlaying
                  ?Icons.pause_circle
                  :Icons.play_circle,
                size: 5.0.sh,
              )
            ),
            SizedBox(width: 2.0.w,),
            IconButton(
                onPressed: onNext,
                icon: Icon(Icons.skip_next,
                  size: 5.0.sh,))
          ],
        ),

      ],
    );
  }
}
