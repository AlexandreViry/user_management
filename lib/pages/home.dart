// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:user_management/components/vibration_service.dart';
import 'package:user_management/pages/profile.dart';

/// Page d'accueil
class MyHomePage extends StatefulWidget {
  /// Constructeur de la d'accueil
  const MyHomePage({Key? key, required this.email}) : super(key: key);

  /// Email pour donner au component sign out firebase
  final String email;

  /// Titre de la page
  final String title = 'User Management';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      MyProfilePage(email: widget.email),
                ),
              );
            },
            tooltip: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                elevation: 10.0,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              onPressed: () async {
                await VibrationService.vibrate();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.vibration),
                  SizedBox(width: 10),
                  Text('Vibrate Phone'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
