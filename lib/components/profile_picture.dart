import 'package:flutter/material.dart';

/// Check if a profile picture exist and will display it
class ProfilePicture extends StatelessWidget {
  /// Constructor with parameters
  const ProfilePicture({required this.onTap, super.key, this.pictureUrl});
  /// This is the url of the image in firebase
  final String? pictureUrl;
  /// Call back when we click on the button
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: pictureUrl != null
                ? NetworkImage(pictureUrl!)
                : const AssetImage('assets/UMLogo.png') as ImageProvider,
          ),
        ),
      ),
    );
  }
}
