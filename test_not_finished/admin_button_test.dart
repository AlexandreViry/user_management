import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_management/components/auth_service.dart';
import 'package:user_management/components/sign_in_button.dart';

class MockAuthService extends Mock implements AuthController {}

void main() {
  late MockAuthService mockAuthService;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  setUp(() {
    mockAuthService = MockAuthService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  });

  tearDown(() {
    emailController.dispose();
    passwordController.dispose();
  });

  testWidgets('ButtonRegister onTap calls register method',
      (WidgetTester tester) async {
    // Build the ButtonRegister widget
    await tester.pumpWidget(MaterialApp(
      home: ButtonRegister(
        emailController: emailController,
        passwordController: passwordController,
      ),
    ));

    // Simulate text input
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    // Tap the button
    await tester.tap(find.byType(GestureDetector));

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Verify that the register method is called with the correct parameters
    verify(mockAuthService.register('test@example.com', 'password')).called(1);
  });
}
