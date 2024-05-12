import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/pages/login.dart';

void main() {
  testWidgets("Test de l'interface utilisateur de la page de connexion",
      (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    // Verify the presence of the main title "Connection"
    expect(find.byKey(const Key('ConnexionTitle')), findsOneWidget);

    // Verify the presence of the secondary title "Connectes toi à ton compte"
    expect(find.byKey(const Key('ConnexionToAccountTitle')), findsOneWidget);

    // Test if the email input field is present
    expect(find.byKey(const Key('emailInput')), findsOneWidget);

    // Test if the password input field is present
    expect(find.byKey(const Key('passwordInput')), findsOneWidget);

    // Test if the login button is present
    expect(find.byKey(const Key('loginButton')), findsOneWidget);

    // Test if the "Je n'ai pas de compte" text is present
    expect(find.byKey(const Key('noAccountText')), findsOneWidget);
  });
}
