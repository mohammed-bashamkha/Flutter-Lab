// import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('music-$soundNumber.mp3'));
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Expanded musicBtn(int soundNumber, String btnText, Color btnColor) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 93, 153, 123),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            onPressed: () async {
              playSound(soundNumber);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Icon(Icons.music_note_rounded, color: btnColor),
                  SizedBox(width: 20.0),
                  Text(
                    btnText,
                    style: TextStyle(fontSize: 20, color: btnColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text('Ringtones'),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 50, 139, 95),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              musicBtn(1, 'Vivo', Colors.red),
              musicBtn(2, 'Huawei', Colors.blue),
              musicBtn(3, 'Nokia', Colors.pink),
              musicBtn(4, 'Itel', Colors.yellow),
              musicBtn(5, 'LG', Colors.orange),
              musicBtn(6, 'Samsung', Colors.purple),
              musicBtn(7, 'Iphone', Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
