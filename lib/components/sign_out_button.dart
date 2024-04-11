import 'package:flutter/material.dart';
import 'package:user_management/components/auth_service.dart';

///  component du bouton de sign out
class SignOutButton extends StatefulWidget {
///  constructeur avec email pour sign out avec firebase
  const SignOutButton({
    required this.email, super.key,
  });

  /// email du user pour sign out avec firebase
  final String email;

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        await AuthController.instance.logout(widget.email);
      },
      child: Container(
        width: w * 0.5,
        height: h * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage(
              'assets/loginbtn3.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center (
          child: Text(
            'Sign Out',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
