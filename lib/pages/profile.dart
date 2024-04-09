import 'package:flutter/material.dart';

/// Page de profile
class MyProfilePage extends StatefulWidget {
  /// Constructeur de la page de profile
  const MyProfilePage({super.key});

  /// Titre de la page
  final String title = 'Page Profile';

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
          iconSize: 30,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Moi',
        ),
      ),
    );
  }
}
