import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:user_management/components/get_x_theme_controller.dart';
import 'package:user_management/components/theme_switching.dart';

void main() {
  setUpAll(() {
    // Active le mode test pour GetX
    Get.testMode = true;
    // Instancie un ThemeController (pour la gestion du thème)
    Get.put(ThemeController());
  });

  // Test vérifiant si le Widget de bascule de thème fonctionne correctement
  testWidgets('ThemeSwitchingWidget toggles theme correctly',
      (WidgetTester tester) async {
    // Construit le widget et déclenche un rendu.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: ThemeSwitchingWidget(),
        ),
      ),
    );

    // Vérifie si le texte "Dark Mode" est présent
    expect(find.text('Dark Mode'), findsOneWidget);
    // Vérifie si l'icône ensoleillée est présente
    expect(find.byIcon(Icons.sunny), findsOneWidget);

    // Simule le tap sur la bascule de thème
    await tester.tap(find.byType(SwitchListTile));
    // Attend que l'animation soit terminée
    await tester.pumpAndSettle();

    // Récupère l'instance du ThemeController
    final ThemeController themeController = Get.find<ThemeController>();
    // Vérifie si le thème actuel est sombre
    expect(themeController.themeData.value.brightness, Brightness.dark);
    // Vérifie si l'icône de mode sombre est présente
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
  });
}
