import 'package:flutter/material.dart';

import 'package:user_management/pages/home.dart';

void main() {
  runApp(const MyApp());
}

/// Page principale
class MyApp extends StatelessWidget {
  /// Constructeur de la page principale
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
