import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/components/input_box_text.dart';

void main() {
  testWidgets('InputBoxText widget test', (WidgetTester tester) async {
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

    expect(find.byType(InputBoxText), findsOneWidget);
  });

  testWidgets('InputBoxText should have prefix icon',
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

    expect(find.byIcon(Icons.email), findsOneWidget);
  });

  testWidgets('InputBoxText should have initial text value',
      (WidgetTester tester) async {
    final TextEditingController controller =
        TextEditingController(text: 'Initial Text');

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

    expect(controller.text, 'Initial Text');
  });

  testWidgets('Entering text into InputBoxText should update controller value',
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

    await tester.enterText(find.byType(TextField), 'New Text');

    expect(controller.text, 'New Text');
  });
}
