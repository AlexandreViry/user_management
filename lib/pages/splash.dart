import 'package:flutter/material.dart';

/// splashScreen page pour le chargement de connection à firebase
class SplashScreen extends StatelessWidget {
  /// super constructeur
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
