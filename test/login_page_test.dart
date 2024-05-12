import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/pages/login.dart';

void main() {
  testWidgets("Test de l'interface utilisateur de la page de connexion",
      (WidgetTester tester) async {
    // Construit le widget LoginPage
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    // Vérifie la présence du titre principal "Connection"
    expect(find.byKey(const Key('ConnexionTitle')), findsOneWidget);

    // Vérifie la présence du titre secondaire "Connectes toi à ton compte"
    expect(find.byKey(const Key('ConnexionToAccountTitle')), findsOneWidget);

    // Teste si le champ de saisie de l'email est présent
    expect(find.byKey(const Key('emailInput')), findsOneWidget);

    // Teste si le champ de saisie du mot de passe est présent
    expect(find.byKey(const Key('passwordInput')), findsOneWidget);

    // Teste si le bouton de connexion est présent
    expect(find.byKey(const Key('loginButton')), findsOneWidget);

    // Teste si le texte "Je n'ai pas de compte" est présent
    expect(find.byKey(const Key('noAccountText')), findsOneWidget);
  });
}
