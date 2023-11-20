import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'marinba_key.dart';

class Marimba extends StatelessWidget {
  Marimba({super.key});
  final AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Column(
      children: [
        const SizedBox(height: 48.0), // Espaciado superior
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MarimbaKey(
                note: 'A',
                soundPath: 'sounds/marimba1.mp3',
                buttonColor: Colors.red,
                player: player,
              ),
              MarimbaKey(
                note: 'B',
                soundPath: 'sounds/marimba2.mp3',
                buttonColor: Colors.blue,
                player: player,
              ),
              MarimbaKey(
                note: 'C',
                soundPath: 'sounds/marimba3.mp3',
                buttonColor: Colors.brown,
                player: player,
              ),
              MarimbaKey(
                note: 'D',
                soundPath: 'sounds/marimba4.mp3',
                buttonColor: Colors.green,
                player: player,
              ),
              MarimbaKey(
                note: 'E',
                soundPath: 'sounds/marimba5.mp3',
                buttonColor: Colors.yellow,
                player: player,
              ),
              MarimbaKey(
                note: 'F',
                soundPath: 'sounds/marimba6.mp3',
                buttonColor: Colors.purple,
                player: player,
              ),
              MarimbaKey(
                note: 'G',
                soundPath: 'sounds/marimba7.mp3',
                buttonColor: Colors.orange,
                player: player,
              ),
              MarimbaKey(
                note: 'H',
                soundPath: 'sounds/marimba8.mp3',
                buttonColor: Colors.pink,
                player: player,
              ),

              // Agrega más teclas de la marimba según sea necesario
            ],
          ),
        ),
        //  const SizedBox(height: 16.0), // Espaciado inferior
      ],
    );
  }
}
