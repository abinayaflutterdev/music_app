import 'package:flutter/material.dart';
import 'package:music_app/audio_screen.dart';
import 'package:music_app/music_data.dart';
import 'package:sizer/sizer.dart';
import 'music_model_class.dart';
import 'custom_detail_music.dart';
import 'package:just_audio/just_audio.dart';
//import 'audio_screen.dart';

class MusicDetailScreen extends StatefulWidget {

  final Music music;

  const MusicDetailScreen({
    super.key,
    required this.music,
  });

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {

  final AudioScreen audioScreen = AudioScreen();

  late int currentIndex;

  bool isPlaying = false;

  Duration position = Duration.zero;

  Duration duration = Duration.zero;

  @override
  void initState(){
    super.initState();
    currentIndex = musicList.indexOf(widget.music);

    audioScreen.audioPlayer.positionStream.listen((newPosition)
    {
      if (mounted){
        setState(() {
          position = newPosition;
        });
      }
    });
    audioScreen.audioPlayer.durationStream.listen((newDuration)
        {
          if (mounted){
            setState(() {
              duration = newDuration ?? Duration.zero;
            });
          }
        });
  }
  void onSliderChanged(double value)
  {
    audioScreen.audioPlayer.seek(
        Duration(
          milliseconds: value.toInt(),
        )
    );
  }
  Future<void> onPlayPause() async {

    if (audioScreen.audioPlayer.playing) {

      await audioScreen.audioPlayer.pause();

      setState(() {
        isPlaying = false;
      });

    } else {

      await audioScreen.audioPlayer.setAsset(
        musicList[currentIndex].audio,
      );

      setState(() {
        isPlaying = true;
      });

      await audioScreen.audioPlayer.play();
    }
  }

  Future<void> onPrevious() async {

    if (currentIndex > 0) {

      currentIndex--;

      await audioScreen.audioPlayer.setAsset(
        musicList[currentIndex].audio,
      );

      setState(() {
        position = Duration.zero;
        isPlaying = true;
      });

      await audioScreen.audioPlayer.play();
    }
  }

  Future<void> onNext() async {

    if (currentIndex < musicList.length - 1) {

      currentIndex++;

      await audioScreen.audioPlayer.setAsset(
        musicList[currentIndex].audio,
      );

      setState(() {
        position = Duration.zero;
        isPlaying = true;
      });

      await audioScreen.audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {

    final Music currentMusic = musicList[currentIndex];
    print(currentMusic);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Music",
        style: TextStyle(
          fontSize: 3.0.sh,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: CustomDetailMusic(
          music: currentMusic,
          isPlaying: isPlaying,
          onPlayPause: onPlayPause,
          onPrevious: onPrevious,
          onNext: onNext,
          onSliderChanged: onSliderChanged,
          duration: duration,
          position: position,
      )

    );
  }
}
