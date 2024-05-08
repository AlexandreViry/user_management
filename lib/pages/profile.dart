import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_management/components/profile_actions.dart';
import 'package:user_management/components/profile_info.dart';
import 'package:user_management/components/profile_picture.dart';
import 'package:user_management/components/theme_switching.dart';

/// Page de profil principale
class MyProfilePage extends StatefulWidget {
  const MyProfilePage({required this.email, super.key});

  /// Email de l'utilisateur
  final String email;

  /// Titre de la page
  final String title = 'Page Profil';

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String? pictureUrl;
  bool _isAdmin = false;

  /// Récupération du user
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
    _fetchProfileImageUrl();
  }

  /// Vérifie le statut administrateur
  Future<void> _checkAdminStatus() async {
    if (user == null) return;

    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      _isAdmin = userDoc.exists && (userDoc.data()?['isAdmin'] == true);
    });
  }

  /// Récupère l'URL de l'image de profil depuis Firestore
  Future<void> _fetchProfileImageUrl() async {
    if (user == null) return;

    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    if (userDoc.exists) {
      setState(() {
        pictureUrl = userDoc.data()?['imageUrl'] as String?;
      });
    }
  }

  /// Change l'image de profil
  Future<void> _changeProfileImage() async {
    String fileName =
        'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageUpload = referenceDirImages.child(fileName);

    try {
      /// Télécharge l'image sélectionnée dans Firebase Storage.
      await referenceImageUpload.putFile(File(pickedImage.path));
      String newPictureUrl = await referenceImageUpload.getDownloadURL();

      /// Met à jour l'URL de l'image dans Firestore pour l'utilisateur actuel.
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'imageUrl': newPictureUrl,
        });
      }
      setState(() {
        pictureUrl = newPictureUrl;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.secondary,
          ),
          iconSize: 30,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProfilePicture(pictureUrl: pictureUrl, onTap: _changeProfileImage),
          ProfileInfo(email: widget.email, isAdmin: _isAdmin),
          const ThemeSwitchingWidget(),
          ProfileActions(email: widget.email),
        ],
      ),
    );
  }
}
