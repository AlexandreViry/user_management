import 'package:flutter/material.dart';
import 'package:user_management/pages/profile.dart';

/// Page d'accueil
class MyHomePage extends StatefulWidget {
  /// Constructeur de la d'accueil
  const MyHomePage({super.key});

  /// Titre de la page
  final String title = 'User Management';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const MyProfilePage()));
            },
            icon: const Icon(Icons.person),
            iconSize: 30,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'USER_MANAGEMENT',
        ),
      ),
    );
  }
}
