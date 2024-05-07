import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_management/components/sign_out_button.dart';
import 'package:user_management/components/theme_switching.dart';

/// Page de profil
class MyProfilePage extends StatefulWidget {
  /// Constructeur de la page de profil
  const MyProfilePage({required this.email, required this.status, super.key});

  /// Email de l'utilisateur
  final String email;

  /// Statut de l'utilisateur (admin ou user)
  final String status;

  /// Titre de la page
  final String title = 'Page Profil';

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  XFile? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _changeProfileImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: GestureDetector(
                onTap: _changeProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(File(_profileImage!.path))
                      : AssetImage('assets/default_profile.png') as ImageProvider,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'Email : ${widget.email}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'Statut : ${widget.status}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const ThemeSwitchingWidget(),
          Center(
            child: SignOutButton(email: widget.email),
          ),
        ],
      ),
    );
  }
}
