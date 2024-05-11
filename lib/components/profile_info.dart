import 'package:flutter/material.dart';

/// Profile informations about the user
class ProfileInfo extends StatelessWidget {
  /// Profile constructor with parameters
  const ProfileInfo({required this.email, required this.isAdmin, super.key});
  /// We get the user's mail
  final String email;
  /// We get the user's role
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Text(
              'Email : $email',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Text(
              'Statut : ${isAdmin ? 'admin' : 'user'}',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
