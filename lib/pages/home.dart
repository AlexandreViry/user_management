import 'package:flutter/material.dart';
import 'package:user_management/components/admin_button.dart';
import 'package:user_management/pages/profile.dart';

/// Page d'accueil
class MyHomePage extends StatefulWidget {
  /// Constructeur de la d'accueil
  const MyHomePage({required this.email, super.key});
  /// email pour donner au component sign out firebase
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
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => MyProfilePage(
                            email: widget.email,
                          )));
            },
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary,
            ),
            iconSize: 30,
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
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
              AdminButton()
          ],
        ),
      ),
    );
  }
}
