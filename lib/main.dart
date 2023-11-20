import 'package:flutter/material.dart';
import 'marinba.dart';

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
            child: Marimba()),
      ),
    );
  }
}
