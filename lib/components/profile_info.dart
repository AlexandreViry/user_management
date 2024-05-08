import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String email;
  final bool isAdmin;

  const ProfileInfo({Key? key, required this.email, required this.isAdmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
