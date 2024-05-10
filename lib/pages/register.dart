import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/input_box_text.dart';
import 'package:user_management/components/input_hide_box_text.dart';
import 'package:user_management/components/sign_in_button.dart';
import 'package:user_management/components/titles.dart';

/// Page de création de compte
class SignUpPage extends StatefulWidget {
  /// Constructeur de la page de création de compte
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
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
                const H1(h1: 'Création'),
                SizedBox(height: h * 0.01),
                const H2(h2: 'Crée-toi un compte'),
                SizedBox(height: h * 0.04),
                InputBoxText(emailController: emailController, textInput: 'email'),
                const SizedBox(height: 20),
                InputHideBoxText(passwordController: passwordController),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: h * 0.04,),
          ButtonRegister(emailController: emailController, passwordController: passwordController),
          SizedBox(height: h * 0.04),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=Get.back,
              text: "j'ai un déjà un compte",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
