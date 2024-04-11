import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/auth_service.dart';
import 'package:user_management/firebase_options.dart';
import 'package:user_management/pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthController()));
  runApp(const MyApp());
}

/// Page principale
class MyApp extends StatelessWidget {
  /// Constructeur de la page principale
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 5, 67)),
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 2, 45, 88),
        scaffoldBackgroundColor: const Color.fromARGB(255, 227, 227, 227),
        canvasColor: const Color.fromARGB(255, 10, 6, 49),
      ),
      home: const SplashScreen(),
    );
  }
}
