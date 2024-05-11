import 'package:flutter/material.dart';

/// page de splash screen
class SplashScreen extends StatelessWidget {
  /// jolie constructeur de splash screen
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Création de la page du splash screen
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            // Ajout de l'animation lorsque l'image apparait
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: Image.asset(
              'assets/UMLogo.png',
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
