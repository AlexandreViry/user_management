import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/components/app_themes.dart';

/// class de controlle du theme de l'app getX
class ThemeController extends GetxController {
  /// Observable pour le thème actuel
  Rx<ThemeData> themeData = AppThemes.lightTheme.obs;

  /// Méthode pour basculer le thème
  void toggleTheme() {
    final bool isDark = themeData.value.brightness == Brightness.dark;
    final ThemeData newTheme = isDark ? AppThemes.lightTheme : AppThemes.darkTheme;
    Get.changeTheme(newTheme);
    themeData.value = newTheme;
  }
}
