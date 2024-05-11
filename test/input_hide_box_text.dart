import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/components/input_hide_box_text.dart';

void main() {
  // Teste le widget InputHideBoxText
  testWidgets('Test du widget InputHideBoxText', (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputHideBoxText(
            passwordController: controller,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que le widget InputHideBoxText est bien présent une fois
    expect(find.byType(InputHideBoxText), findsOneWidget);
  });

  // Teste si InputHideBoxText contient une icône préfixée
  testWidgets('InputHideBoxText devrait avoir une icône préfixée',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputHideBoxText(
            passwordController: TextEditingController(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que l'icône de mot de passe est présente
    expect(find.byIcon(Icons.password), findsOneWidget);
  });

  // Teste le basculement de la visibilité du mot de passe en cliquant sur l'icône de l'œil
  testWidgets(
      'InputHideBoxText devrait basculer la visibilité du mot de passe en cliquant sur l\'icône de l\'œil',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputHideBoxText(
            passwordController: controller,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que le texte est initialement masqué
    expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);

    // Simule un tap sur l'icône de l'œil pour basculer la visibilité
    await tester.tap(find.byIcon(Icons.remove_red_eye));
    await tester.pumpAndSettle();

    // Vérifie que le texte n'est plus masqué
    expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText, isFalse);
  });

  // Teste la mise à jour de la valeur du contrôleur lors de la saisie de texte
  testWidgets(
      'Entrer du texte dans InputHideBoxText devrait mettre à jour la valeur du contrôleur',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputHideBoxText(
            passwordController: controller,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Simule l'entrée de texte
    await tester.enterText(find.byType(TextField), 'Password123');

    // Vérifie que le texte du contrôleur a été mis à jour
    expect(controller.text, 'Password123');
  });
}
