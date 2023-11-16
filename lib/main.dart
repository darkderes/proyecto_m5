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
      home: Scaffold(
       
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/fondo_madera.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          
          child: const Marimba()),
      ),
    );
  }
}

class Marimba extends StatelessWidget {
  const Marimba({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

  return Column(
      children: [
        //const SizedBox(height: 24.0), // Espaciado superior
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      
        children: [
          MarimbaKey(note: 'A',soundPath: 'sounds/marimba1.mp3',buttonColor: Colors.red,),
          MarimbaKey(note: 'B',soundPath: 'sounds/marimba2.mp3',buttonColor: Colors.blue,),
          MarimbaKey(note: 'C',soundPath: 'sounds/marimba3.mp3',buttonColor: Colors.brown,),
          MarimbaKey(note: 'D',soundPath: 'sounds/marimba4.mp3',buttonColor: Colors.green,),
          MarimbaKey(note: 'E',soundPath: 'sounds/marimba5.mp3',buttonColor: Colors.yellow,),
          MarimbaKey(note: 'F',soundPath: 'sounds/marimba6.mp3',buttonColor: Colors.purple,),
          MarimbaKey(note: 'G',soundPath: 'sounds/marimba7.mp3',buttonColor: Colors.orange,),
          MarimbaKey(note: 'H',soundPath: 'sounds/marimba8.mp3',buttonColor: Colors.pink,),
       
      
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
  final String soundPath ;
   final Color buttonColor; // Ajusta según tus archivos de sonido

  MarimbaKey({super.key, required this.note,required this.soundPath,required this.buttonColor});

  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: AnimatedButton(
            shadowDegree: ShadowDegree.dark,
            color: buttonColor,
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.1,
            onPressed: () async {
               player.setReleaseMode(ReleaseMode.release);
              await player.play(AssetSource(soundPath));
            },
            //    style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
             
            // ),
            child: Center(
              child: Text(
                note,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
