import 'package:flutter/material.dart';
import 'package:user_management/components/sign_out_button.dart';
import 'package:user_management/components/theme_switching.dart';

/// Page de profile
class MyProfilePage extends StatefulWidget {
  /// Constructeur de la page de profile
  const MyProfilePage({required this.email, super.key,});
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.secondary,
          ),
          iconSize: 30,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'Moi',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, 
                ),
              ),
            ),
          ),
          const ThemeSwitchingWidget(),
          Center(
            child: SignOutButton(email: widget.email),
          ),
        ],
      ),
    );
  }
}
