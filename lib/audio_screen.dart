import 'package:just_audio/just_audio.dart';

class AudioScreen{

  static final AudioScreen _instance = AudioScreen._internal();

  factory AudioScreen() {
    return _instance;
  }

  AudioScreen._internal();

  final AudioPlayer audioPlayer = AudioPlayer();

  int? currentIndex;
}