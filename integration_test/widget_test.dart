import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:user_management/components/auth_service.dart';
import 'package:user_management/main.dart' as app;
import 'package:user_management/pages/home.dart';
import 'package:user_management/pages/login.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> typeText(WidgetTester tester, String key, String text) async {
    await tester.enterText(
      find.byKey(Key(key)),
      text,
    );
  }

  Future<void> logoutFirebase() async {
    final AuthController authController = Get.find<AuthController>();
    await authController.logout();
  }

  Future<void> settingUp(WidgetTester tester) async {
    await app.main();
    await logoutFirebase();
    await tester.pumpAndSettle();
  }

  group('Login Page Tests', () {
    setUpAll(() async {
      Get.testMode = true;
    });
    testWidgets('Login correctly', (WidgetTester tester) async {
      //await settingUp(tester);
      await app.main();
      await tester.pumpAndSettle();
      await logoutFirebase();

      expect(find.byType(LoginPage), findsOneWidget);

      // Saisir le mail
      await typeText(tester, 'email-field', 'val.test@gmail.com');
      await tester.pumpAndSettle();

      // Saisir le mot de passe
      await typeText(tester, 'pwd-field', 'testtest');

      // Appuyer sur le bouton de connexion
      await tester.tap(find.byKey(const Key('login-btn')));
      await tester.pumpAndSettle();

      expect(find.byType(MyHomePage), findsOneWidget);
    });


    testWidgets('Login but not register', (WidgetTester tester) async {
      await settingUp(tester);

      expect(find.byType(LoginPage), findsOneWidget);

      // Saisir le mail
      await typeText(tester, 'email-field', 'valouu.test@gmail.com');
      await tester.pumpAndSettle();

      // Saisir le mot de passe
      await typeText(tester, 'pwd-field', 'testtest');

      // Appuyer sur le bouton de connexion
      await tester.tap(find.byKey(const Key('login-btn')));
      await tester.pumpAndSettle();

      await tester.pumpWidget(const LoginPage());
    });

    /*

    testWidgets('Login without email', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login without password', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login without nothing', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('On Login go on Register page', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('On Login go on Register go on Login', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('On Login go on Register go on Login and Login', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login with incorrect email', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login with incorrect password', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login with too long email', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login with too long password', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login with too short password', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login in desactivated account', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('Login in blocked account', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('???', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });
    
    testWidgets('go Login, Login correctly get home page quit app reopen app get home', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());
    });

    
  });


  group('Register Page Tests', () {
    testWidgets('get Register page', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });

    testWidgets('Register correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });

    testWidgets('Register alreay registred', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });

    testWidgets('Register without email', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register without password', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register without nothing', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('On Register go on Login page', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('On Register go on Login go on Register', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('On Register go on Login go on Register and Register', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register with incorrect email', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register with too long email', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register with too long password', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('Register with too short password', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('???', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });
    
    testWidgets('go Register, Register correctly get home page quit app reopen app get home', (WidgetTester tester) async {
      await tester.pumpWidget(const SignUpPage());
    });

    
      */
  });
}
