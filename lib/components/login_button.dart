import 'package:flutter/material.dart';
import 'package:user_management/components/auth_service.dart';

///  component du bouton de login
class ButtonLogin extends StatelessWidget {
///  constructeur avec email et password du user
  const ButtonLogin({
      required this.emailController, required this.passwordController, super.key,
    });

    /// email du user
    final TextEditingController emailController;
    /// password du user
    final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        await AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
      },
      child: Container(
        width: w * 0.5,
        height: h * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage(
              'assets/loginbtn2.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center (
          child: Text(
            'Sign in',
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
