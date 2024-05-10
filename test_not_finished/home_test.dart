import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/pages/home.dart';
import 'package:user_management/pages/profile.dart';

void main() {
  testWidgets('MyHomePage widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(email: 'test@example.com'),
    ));

    // Verify that the title is rendered.
    expect(find.text('User Management'), findsOneWidget);

    // Verify that the icon button for profile exists.
    expect(find.byIcon(Icons.person), findsOneWidget);

    // Tap the icon button and wait for navigation to complete.
    await tester.tap(find.byIcon(Icons.person));
    await tester
        .pumpAndSettle(); // Wait for animations and navigation to complete.

    // Verify that MyProfilePage is pushed onto the navigation stack.
    expect(find.byType(MyProfilePage), findsOneWidget);
  });
}
