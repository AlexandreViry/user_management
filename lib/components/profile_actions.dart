import 'package:flutter/material.dart';
import 'package:user_management/components/sign_out_button.dart';

class ProfileActions extends StatelessWidget {
  final String email;

  const ProfileActions({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SignOutButton(email: email),
        ],
      ),
    );
  }
}
