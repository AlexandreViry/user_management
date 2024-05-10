// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../lib/components/user_status.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

void main() {
  setUpAll(() {
    // Register fallback values for mocktail to use
    registerFallbackValue(MockDocumentReference());
    registerFallbackValue(MockDocumentSnapshot());
  });

  group('checkAdminStatus', () {
    late FirebaseFirestore mockFirestore;
    late CollectionReference<Map<String, dynamic>> mockCollectionReference;
    late DocumentReference<Map<String, dynamic>> mockDocumentReference;
    late DocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot;
    late userStatus statusChecker;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      statusChecker = userStatus();

      when(() => mockFirestore.collection('users'))
          .thenReturn(mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
    });

    test('returns true when user is an admin', () async {
      when(() => mockDocumentSnapshot.exists).thenReturn(true);
      when(() => mockDocumentSnapshot.data()).thenReturn({'isAdmin': true});
      expect(await statusChecker.checkAdminStatus('00000'), true);
    });

    test('returns false when user is not an admin', () async {
      when(() => mockDocumentSnapshot.exists).thenReturn(true);
      when(() => mockDocumentSnapshot.data()).thenReturn({'isAdmin': false});
      expect(await statusChecker.checkAdminStatus('nonAd00000minUid'), false);
    });

    test('returns false when user does not exist', () async {
      when(() => mockDocumentSnapshot.exists).thenReturn(false);
      expect(await statusChecker.checkAdminStatus('nonexistentUid'), false);
    });

    test('returns false and logs error on exception', () async {
      when(() => mockDocumentReference.get())
          .thenThrow(Exception('Firebase error'));
      expect(await statusChecker.checkAdminStatus('errorUid'), false);
    });
  });
}
