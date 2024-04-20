import 'package:flutter/material.dart';


// Création de la page splashScreen
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // Ajout du dégradé
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        // Ajout du logo user_management au centre de l'image
        child: Center(
          child: Image.asset(
            'assets/UMLogo.png',
            width: 200,
          )
        ),
      ),
    );
  }
}
