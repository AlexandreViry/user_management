import 'package:flutter/material.dart';
import 'package:user_management/components/vibration_service.dart';
import 'package:user_management/components/admin_button.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'USER_MANAGEMENT',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            AdminButton(),
            SizedBox(height: 20), // Spacing between the text/button and the vibration button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                elevation: 10.0,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              onPressed: () async {
                await VibrationService.vibrate();
              },
              child: Row(
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
