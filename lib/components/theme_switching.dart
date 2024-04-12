import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/get_x_theme_controller.dart'; // Assurez-vous que le chemin d'importation est correct

/// Widget de changement de thème
class ThemeSwitchingWidget extends StatelessWidget {
  /// Joli constructeur
  const ThemeSwitchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() => SwitchListTile(
      title: const Text('Dark Mode'),
      value: themeController.themeData.value.brightness == Brightness.dark,
      onChanged: (_) {
        themeController.toggleTheme();
      },
      secondary: themeController.themeData.value.brightness == Brightness.dark
        ? const Icon(Icons.dark_mode, color: Color.fromARGB(255, 70, 13, 225))
        : const Icon(Icons.sunny, color: Color.fromARGB(255, 255, 162, 0)),
    ),);
  }
}
