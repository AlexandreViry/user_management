import 'package:flutter/material.dart';

/// Classe pour afficher les informations du profil de l'utilisateur.
class ProfileInfo extends StatelessWidget {
  /// Constructeur de ProfileInfo nécessitant un email et un statut administrateur.
  const ProfileInfo({required this.email, required this.isAdmin, super.key});

  /// Email de l'utilisateur.
  final String email;

  /// Booléen indiquant si l'utilisateur est un administrateur.
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
