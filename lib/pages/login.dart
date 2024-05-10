import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/google_button.dart';
import 'package:user_management/components/input_box_text.dart';
import 'package:user_management/components/input_hide_box_text.dart';
import 'package:user_management/components/login_button.dart';
import 'package:user_management/components/titles.dart';
import 'package:user_management/pages/register.dart';

/// Page de login
class LoginPage extends StatefulWidget {
  /// Constructeur de la page login
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: h * 0.2),
                const H1(h1: 'Connection'),
                SizedBox(height: h * 0.01),
                const H2(h2: 'Connectes toi à ton compte'),
                SizedBox(height: h * 0.03),
                InputBoxText(
                    emailController: emailController, textInput: 'email'),
                const SizedBox(height: 20),
                InputHideBoxText(passwordController: passwordController),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.03,
          ),
          ButtonLogin(
              emailController: emailController,
              passwordController: passwordController),
          SizedBox(height: h * 0.02),
          RichText(
            key: const Key('noAccountText'),
            text: TextSpan(
              text: "Je n'ai pas de compte:",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: ' Créer',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => Get.to(() => const SignUpPage()),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.02),
          const GoogleButton(),
        ],
      ),
    );
  }
}
