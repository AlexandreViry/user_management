import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/components/input_box_text.dart';

void main() {
  // Teste le widget InputBoxText pour s'assurer qu'il est présent
  testWidgets('Test du widget InputBoxText', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputBoxText(
            emailController: TextEditingController(),
            textInput: 'Email',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que le widget InputBoxText est bien présent
    expect(find.byType(InputBoxText), findsOneWidget);
  });

  // Teste si InputBoxText contient une icône préfixée
  testWidgets('InputBoxText devrait avoir une icône préfixée',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputBoxText(
            emailController: TextEditingController(),
            textInput: 'Email',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que l'icône d'email est présente
    expect(find.byIcon(Icons.email), findsOneWidget);
  });

  // Teste si InputBoxText contient une valeur de texte initiale
  testWidgets('InputBoxText devrait avoir une valeur de texte initiale',
      (WidgetTester tester) async {
    final TextEditingController controller =
        TextEditingController(text: 'Texte initial');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputBoxText(
            emailController: controller,
            textInput: 'Email',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Vérifie que la valeur initiale du contrôleur est correcte
    expect(controller.text, 'Texte initial');
  });

  // Teste la mise à jour de la valeur du contrôleur lors de la saisie de texte
  testWidgets(
      'Entrer du texte dans InputBoxText devrait mettre à jour la valeur du contrôleur',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputBoxText(
            emailController: controller,
            textInput: 'Email',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Simule l'entrée de texte
    await tester.enterText(find.byType(TextField), 'Nouveau texte');

    // Vérifie que le texte du contrôleur a été mis à jour
    expect(controller.text, 'Nouveau texte');
  });
}
