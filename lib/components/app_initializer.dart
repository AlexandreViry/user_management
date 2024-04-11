import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_management/pages/register.dart';

/// Class d'initialisation de firebase
class AppInitializer extends StatelessWidget {
/// constructeur d'initialisation de firebase
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context)  {
    return FutureBuilder<FirebaseApp>(
      /// Initialisation de Firebase
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        // Vérifier les états de la connexion
        if (snapshot.connectionState == ConnectionState.done) {
          return const SignUpPage(); 
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Erreur d'initialisation de Firebase"),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),  // Indicateur de chargement pendant l'initialisation
        );
      },
    );
  }
}
