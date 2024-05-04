import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);
  }

  Widget buildXylophoneKey(
      {required double width,
      required Color color,
      required String soundPath}) {
    return ElevatedButton(
      onPressed: () async {
        playSound(soundPath);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            color, // Background color of the button// Optional padding
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10)), // Optional:// rounded corners
      ),
      child: SizedBox(
        width: width,
      ),
    );
  }

  Future<void> playSound(String soundPath) async {
    await player.setSource(AssetSource(soundPath));
    await player.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Xylophone',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildXylophoneKey(
                  width: 250.0, color: Colors.red, soundPath: 'note1.wav'),
              buildXylophoneKey(
                  width: 220.0, color: Colors.orange, soundPath: 'note2.wav'),
              buildXylophoneKey(
                  width: 200.0, color: Colors.yellow, soundPath: 'note3.wav'),
              buildXylophoneKey(
                  width: 180.0,
                  color: Colors.lightGreenAccent,
                  soundPath: 'note4.wav'),
              buildXylophoneKey(
                  width: 160.0, color: Colors.green, soundPath: 'note5.wav'),
              buildXylophoneKey(
                  width: 140.0, color: Colors.blue, soundPath: 'note6.wav'),
              buildXylophoneKey(
                  width: 120.0, color: Colors.purple, soundPath: 'note7.wav'),
            ],
          ),
        ),
      ),
    );
  }
}
