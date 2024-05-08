// ignore_for_file: public_member_api_docs, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management/components/notification_button.dart';
import 'package:user_management/components/user_status.dart';

class AdminButton extends StatefulWidget {
  const AdminButton({super.key});

  @override
  _AdminButtonState createState() => _AdminButtonState();
}

class _AdminButtonState extends State<AdminButton> {
  bool _isAdmin = false;

  @override
  Future<void> initState() async {
    super.initState();
    await _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    final User? user = FirebaseAuth.instance.currentUser;

    final bool isAdmin = await userStatus().checkAdminStatus(user!.uid);
    setState(() {
      _isAdmin = isAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isAdmin
          ? () {
              NotificationService.pushNotification(
                  title: 'Admin button',
                  body:
                      'You are an admin, this is why you are special and can press this button');
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: _isAdmin ? null : Colors.grey,
      ),
      child: const Text('Admin only'),
    );
  }
}
