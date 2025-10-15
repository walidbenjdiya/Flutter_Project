import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart'; // pour la sélection aléatoire

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Liste d’images (tu peux utiliser des images locales ou des URLs)
  final List<String> images = [
    'assets/img/360_F_344575885_2EGHG68pEUAuXXstVEjLn91y9VN6QFaI.jpg',
    'assets/img/Holographic-Spotlight-2.png',
    'assets/img/pngtree-glistening-holographic-foil-surface-image_13615066.png',
    'assets/img/pngtree-hologram-abstract-liquid-colorfull-picture-image_1264652.jpg',
    
  ];

  String currentImage = 'https://picsum.photos/600/900?random=0';
  final Random random = Random();

  void changeBackgroundImage() {
    setState(() {
      currentImage = images[random.nextInt(images.length)];
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Click-TO-Switch', style:TextStyle( color: Colors.white) ),
        backgroundColor: const Color.fromARGB(255, 17, 60, 2),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🖼️ Image d’arrière-plan
          Image.network(
            currentImage,
            fit: BoxFit.cover,
          ),

          // 🌫️ Légère surcouche pour lisibilité
          Container(color: Colors.black.withOpacity(0.3)),

          // 🧱 Contenu principal (texte + bouton)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 📝 Section description texte
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Bienvenue sur ClickSwitch APP !\n'
                    'Cliquez sur le bouton ci-dessous pour changer l’arrière-plan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🎯 Bouton centré
                ElevatedButton(
                  onPressed: changeBackgroundImage,
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Changer l’image',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}