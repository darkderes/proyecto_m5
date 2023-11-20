import 'package:animated_button/animated_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_m5/widget_dot_black.dart';

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

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width *
        0.1; // This is the width of your button
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Stack(
            children: [
              AnimatedButton(
                shadowDegree: ShadowDegree.dark,
                color: buttonColor,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.1,
                onPressed: () async {
                  await player.stop();
                  player.setReleaseMode(ReleaseMode.release);
                  await player.play(AssetSource(soundPath));
                },
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
              WidgetDotBlack(isTop: true, buttonSize: buttonSize),
              WidgetDotBlack(isTop: false, buttonSize: buttonSize),
            ],
          ),
        ),
      ),
    );
  }
}
