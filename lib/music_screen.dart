import 'package:flutter/material.dart';
import 'package:music_app/audio_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:music_app/custom_music_screen.dart';
import 'music_data.dart';
import 'package:just_audio/just_audio.dart';
import 'music_detail_screen.dart';
//import 'audio_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  final AudioScreen audioScreen = AudioScreen();

  int? playingIndex;

  Future<void> playPause(int index) async{

    if(playingIndex == index && audioScreen.audioPlayer.playing) {
      await audioScreen.audioPlayer.pause();
      setState(() {
        playingIndex = null;
      });
    }else{
      await audioScreen.audioPlayer.setAsset(
        musicList[index].audio,
      );
      setState(() {
        playingIndex=index;
      });
     await audioScreen.audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(children: [
        Text("My Music",
        style: TextStyle(
          fontSize: 4.0.sh,
          fontWeight: FontWeight.bold,
          color: Colors.black,
           ),),
      ],),),
      body: ListView.builder(

          itemCount: musicList.length,
        itemBuilder: (context,index){
            return CustomMusicScreen(
                music: musicList[index],
                playingButton: playingIndex == index,
                ofPause: (){
                  playPause(index);
                },
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MusicDetailScreen(
                      music: musicList[index])));
              },

            );
        },
      ),
    );
  }
}

