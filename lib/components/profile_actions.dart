import 'package:flutter/material.dart';
import 'package:user_management/components/sign_out_button.dart';

/// The interactions when the button is pressed
class ProfileActions extends StatelessWidget {
  /// Constructor
  const ProfileActions({required this.email, super.key});
  /// We need the user's email to signout
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SignOutButton(email: email),
        ],
      ),
    );
  }
}
