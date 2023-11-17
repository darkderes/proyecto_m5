import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/fondo_madera.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child:  Marimba()),
      ),
    );
  }
}

class Marimba extends StatelessWidget {
   Marimba({super.key});
  final AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Column(
      children: [
        //const SizedBox(height: 24.0), // Espaciado superior
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

class MarimbaKey extends StatelessWidget {
  final String note;
  final String soundPath;
  final Color buttonColor;
  final AudioPlayer player; // Ajusta según tus archivos de sonido

  const MarimbaKey(
      {super.key,
      required this.note,
      required this.soundPath,
      required this.buttonColor,
      required this.player});

 //final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Stack(
            children: [
              AnimatedButton(
                shadowDegree: ShadowDegree.dark,
                color: buttonColor,
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.1,
                onPressed: () async {
                  await player.stop();
                  player.setReleaseMode(ReleaseMode.release);
                  await player.play(AssetSource(soundPath));
                },
                //    style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all<Color>(buttonColor),

                // ),
                child: Center(
                  child: Text(
                    note,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 19,
                left: MediaQuery.of(context).size.width / 29,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 19,
                left: MediaQuery.of(context).size.width / 25,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
