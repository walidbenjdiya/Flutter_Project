import 'package:flutter/material.dart';
import 'dart:math'; // pour générer des couleurs aléatoires

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color backgroundColor = Colors.white; // couleur initiale

  // Fonction pour générer une couleur aléatoire
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // rouge
      random.nextInt(256), // vert
      random.nextInt(256), // bleu
    );
  }

  void changeBackgroundColor() {
    setState(() {
      backgroundColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Click-TO-Switch',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 60, 2),
        centerTitle: true,
      ),
      body: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: changeBackgroundColor,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: const Text(
            'Changer la couleur',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}