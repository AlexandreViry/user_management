import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:user_management/pages/home.dart';
import './mock.dart';

void main() {
  /// Configure les mocks d'authentification Firebase
  setupFirebaseAuthMocks();

  setUpAll(() async {
    /// Initialise Firebase
    await Firebase.initializeApp();
  });

  testWidgets('MyHomePage a un titre et un bouton de message',
      (WidgetTester tester) async {
    /// Charge le widget MaterialApp avec MyHomePage
    await tester.pumpWidget(
      const MaterialApp(home: MyHomePage(email: 'test@example.com')),
    );

    /// Vérifie que le titre est affiché
    expect(find.text('User Management'), findsOneWidget);

    /// Vérifie que le bouton de vibration est présent
    expect(find.text('Vibrate Phone'), findsOneWidget);

    /// Déclenche le bouton optionnellement et vérifie les interactions
    await tester.tap(find.byKey(const Key('vibrateButton')));
    await tester.pump();

    /// Anime si des réponses retardées ou des animations sont présentes
  });
}
