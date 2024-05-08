// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:user_management/components/admin_button.dart';
// import 'package:user_management/components/user_status.dart';

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// class MockUser extends Mock implements User {}

// class MockUserStatus extends Mock implements userStatus {}

// void main() {
//   late MockFirebaseAuth mockFirebaseAuth;
//   late MockUser mockUser;
//   late MockUserStatus mockUserStatus;

//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     mockUser = MockUser();
//     mockUserStatus = MockUserStatus();
//     // Set up mock returns
//     when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
//     when(mockUser.uid).thenReturn('123');
//     // Ensure FirebaseAuth.instance returns the mock
//     FirebaseAuth.instance = mockFirebaseAuth;
//   });

//   testWidgets('AdminButton enables for admin users',
//       (WidgetTester tester) async {
//     // Assume the user is an admin
//     when(mockUserStatus.checkAdminStatus(any)).thenAnswer((_) async => true);

//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MaterialApp(
//       home: Scaffold(
//         body: AdminButton(),
//       ),
//     ));

//     // Allow time for initState to complete.
//     await tester.pumpAndSettle();

//     // Verify the button is enabled
//     final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
//     expect(button.onPressed, isNotNull);
//     expect(find.text('Admin only'), findsOneWidget);
//   });

//   testWidgets('AdminButton disables for non-admin users',
//       (WidgetTester tester) async {
//     // Assume the user is not an admin
//     when(mockUserStatus.checkAdminStatus(any)).thenAnswer((_) async => false);

//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MaterialApp(
//       home: Scaffold(
//         body: AdminButton(),
//       ),
//     ));

//     // Allow time for initState to complete.
//     await tester.pumpAndSettle();

//     // Verify the button is disabled
//     final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
//     expect(button.onPressed, isNull);
//     expect(find.text('Admin only'), findsOneWidget);
//   });
// }
