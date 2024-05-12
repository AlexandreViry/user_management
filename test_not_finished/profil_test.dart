import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:user_management/components/get_x_theme_controller.dart';
import 'package:user_management/components/sign_out_button.dart';
import 'package:user_management/components/theme_switching.dart';
import 'package:user_management/pages/profile.dart';

void main() {
  setUpAll(() {
    Get.testMode = true; /// Active le mode test de GetX
    Get.put(
        ThemeController()); /// Initialise ThemeController pour l'environnement de test.
  });
  /// Widget auxiliaire pour encapsuler la page avec le MaterialApp nécessaire
  Widget createMyProfilePage(String email) => MaterialApp(
        home: MyProfilePage(email: email),
      );

  group('Tests de MyProfilePage', () {
    /// Test pour vérifier si tous les composants de l'UI sont correctement chargés
    testWidgets(
        'Vérifie si tous les widgets sont présents et correctement configurés',
        (WidgetTester tester) async {
      const email = 'test@example.com';
      await tester.pumpWidget(createMyProfilePage(email));

      /// Vérifie l'AppBar et ses propriétés
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Page Profile'), findsOneWidget);
      expect(find.widgetWithIcon(IconButton, Icons.home), findsOneWidget);

      /// Vérifie le contenu principal
      final Text moiText = tester.widget(find.text('Moi'));
      expect(
          moiText.style?.color,
          equals(
              Theme.of(tester.element(find.text('Moi'))).colorScheme.primary));

      /// Vérifie la présence de ThemeSwitchingWidget et SignOutButton
      expect(find.byType(ThemeSwitchingWidget), findsOneWidget);
      expect(find.byType(SignOutButton), findsOneWidget);

      /// Assure que le SignOutButton reçoit le bon email
      final SignOutButton signOutButton =
          tester.widget(find.byType(SignOutButton));
      expect(signOutButton.email, equals(email));
    });

    /// Test d'interaction pour vérifier la navigation
    testWidgets('Le bouton IconButton doit revenir à la page précédente',
        (WidgetTester tester) async {
      await tester.pumpWidget(createMyProfilePage('test@example.com'));

      /// Simule l'appui sur le bouton IconButton pour revenir à l'accueil
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
    });
  });
}
