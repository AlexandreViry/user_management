import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:user_management/pages/home.dart';
import './mock.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('MyHomePage has a title and message button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MyHomePage(email: 'test@example.com')),
    );

    // Verify the title is displayed
    expect(find.text('User Management'), findsOneWidget);

    // Verify the vibrate button is present
    expect(find.text('Vibrate Phone'), findsOneWidget);

    // Optionally, trigger the button and check interactions
    await tester.tap(find.byKey(const Key('vibrateButton')));
    await tester.pump(); // Pump if there are animations or delayed responses
  });
}
