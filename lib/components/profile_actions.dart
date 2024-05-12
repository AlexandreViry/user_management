import 'package:flutter/material.dart';
import 'package:user_management/components/sign_out_button.dart';

/// Classe pour gérer les actions sur la page de profil.
class ProfileActions extends StatelessWidget {
  /// Constructeur de ProfileActions qui nécessite un email.
  const ProfileActions({required this.email, super.key});

  /// Email de l'utilisateur utilisé pour les actions de profil.
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SignOutButton(email: email),
        ],
      ),
    );
  }
}
