import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:user_management/components/auth_service.dart';
import 'package:user_management/components/input_box_text.dart';
import 'package:user_management/components/input_hide_box_text.dart';
import 'package:user_management/components/sign_in_button.dart';
import 'package:user_management/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setUpAll(() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Initialize AuthController
    Get.put(AuthController());
  });

  tearDown(() {
    // Dispose AuthController after test
    Get.delete<AuthController>();
  });

  testWidgets('Register Test', (WidgetTester tester) async {
    // Build the SignUpPage widget
    await tester.pumpWidget(MaterialApp(
      home: SignUpPage(),
    ));

    // Find the email and password text fields
    final Finder emailField = find.byType(InputBoxText).first;
    final Finder passwordField = find.byType(InputHideBoxText).first;

    // Enter text into the email and password fields
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password');

    // Find the register button
    final Finder registerButton = find.byType(ButtonRegister);

    // Tap the register button
    await tester.tap(registerButton);

    // Wait for the registration process to complete
    await tester.pump();

    // Expect that the registration method was called
    expect(AuthController.instance.registerCalled, true);
  });
}
