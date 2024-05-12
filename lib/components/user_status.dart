import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

///
class UserStatus {
  ///
  Future<bool> checkAdminStatus(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final dynamic isAdmin = userDoc['isAdmin'] ?? false;
        return isAdmin;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          "Erreur lors de la récupération du statut d'administrateur : $e",
        );
      }
    }
    return false;
  }
}
