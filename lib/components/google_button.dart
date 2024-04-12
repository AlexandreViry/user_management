import 'package:flutter/material.dart';
import 'package:user_management/components/auth_service.dart';

///  component du bouton sign in avec google
class GoogleButton extends StatelessWidget {
///  jolie constructeur
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AuthController.instance.signInWithGoogle();
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(255, 2, 45, 88),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              'assets/google.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
