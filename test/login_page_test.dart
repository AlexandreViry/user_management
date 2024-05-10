import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/pages/login.dart';

void main() {
  testWidgets('Login Page UI Test', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    // Test if the main title "Connection" is present
    expect(find.text('Connection'), findsOneWidget);

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
