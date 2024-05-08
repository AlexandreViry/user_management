import 'package:cloud_firestore/cloud_firestore.dart';

class userStatus {
  Future<bool> checkAdminStatus(String uid) async {
    try {
      var userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        var isAdmin = userDoc['isAdmin'] ?? false;
        return isAdmin;
      }
    } catch (e) {
      print('Erreur lors de la récupération du statut d\'administrateur : $e');
    }
    return false;
  }
}
