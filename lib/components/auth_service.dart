
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:user_management/pages/home.dart';
import 'package:user_management/pages/login.dart';

/// Class de méthodes pour firebase
class AuthController extends GetxController{
  /// création d'instance
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  /// assingnation de l'instance
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges()); 
    ever(_user, _initialScreens);
  }

  Future<void> _initialScreens(User? user) async {
    if (user == null) {
      await Get.offAll(()=> const LoginPage());
    } else {
      await Get.offAll(() => MyHomePage(email: user.email!));
    }
  }

  /// création de compte firebase
  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar('About User',  'User message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        'Account creation failed',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        e.toString(),
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
      );
    }
  }

  /// login firebase
  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar('About Login',  'Login message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        'Login failed',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        e.toString(),
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
      );
    }
  }
  /// logout firebase
  Future<void> logout(String email) async {
    await auth.signOut();
    await signOut(email);
  }

  /// sign in with google and firebase
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>['email'],).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// deconnection de l'app
  Future<void> signOut(String email) async {
    await FirebaseAuth.instance.signOut();
  }
}
