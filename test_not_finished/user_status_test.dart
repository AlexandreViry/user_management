import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/components/user_status.dart';
import 'package:flutter/widgets.dart';

void main() {
  setUpAll(() async {
    // Initialize Firebase before using Firestore
    WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter widgets
    await Firebase.initializeApp(); // Initialize Firebase
  });

  group('UserStatus', () {
    late FirebaseFirestore firestore;
    late UserStatus userStatus;

    setUp(() {
      // Initialisez une instance de Firestore pour chaque test
      firestore = FirebaseFirestore.instance;
      userStatus = UserStatus(firestore);
    });

    test('checkAdminStatus returns true for admin user', () async {
      // Ajoutez un utilisateur admin à la base de données Firestore pour ce test
      await firestore
          .collection('users')
          .doc('admin_uid')
          .set({'isAdmin': true});

      // Vérifiez si l'utilisateur admin est considéré comme admin
      expect(await userStatus.checkAdminStatus('admin_uid'), isTrue);
    });

    test('checkAdminStatus returns false for non-admin user', () async {
      // Ajoutez un utilisateur non-admin à la base de données Firestore pour ce test
      await firestore
          .collection('users')
          .doc('non_admin_uid')
          .set({'isAdmin': false});

      // Vérifiez si l'utilisateur non-admin n'est pas considéré comme admin
      expect(await userStatus.checkAdminStatus('non_admin_uid'), isFalse);
    });
  });
}
