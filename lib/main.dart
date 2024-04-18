import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/auth_service.dart';
import 'package:user_management/components/get_x_theme_controller.dart';
import 'package:user_management/firebase_options.dart';
import 'package:user_management/pages/splash.dart';
import 'package:user_management/pages/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeController themeController = Get.put(ThemeController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthController()));
  runApp(MyApp());
}

/// Page principale
class MyApp extends StatelessWidget {
  /// Constructeur de la page principale
  MyApp({super.key});

  /// Récuperation du theme de l'app
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeController.themeData.value,
      home: const SplashScreen(),
    );
  }
}
