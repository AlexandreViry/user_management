import 'package:flutter/material.dart';
import 'package:user_management/components/sign_out_button.dart';
/// Page de profile
class MyProfilePage extends StatefulWidget {
  /// Constructeur de la page de profile
  const MyProfilePage({
    required this.email, super.key,
  });
  /// email a envoyer pour le sign out firebase
  final String email;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'Moi',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Center(
            child: SignOutButton(email: widget.email),
          ),
        ],
      ),
    );
  }
}
