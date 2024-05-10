import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/components/input_hide_box_text.dart';

void main() {
  testWidgets('InputHideBoxText widget test', (WidgetTester tester) async {
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

    expect(find.byType(InputHideBoxText), findsOneWidget);
  });

  testWidgets('InputHideBoxText should have prefix icon',
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

    expect(find.byIcon(Icons.password), findsOneWidget);
  });

  testWidgets(
      'InputHideBoxText should toggle password visibility when eye icon is tapped',
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

    expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);

    await tester.tap(find.byIcon(Icons.remove_red_eye));
    await tester.pumpAndSettle();

    expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText, isFalse);
  });

  testWidgets(
      'Entering text into InputHideBoxText should update controller value',
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

    await tester.enterText(find.byType(TextField), 'Password123');

    expect(controller.text, 'Password123');
  });
}
