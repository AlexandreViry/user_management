import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management/components/user_status.dart';
import 'package:user_management/components/notification_button.dart';

class AdminButton extends StatefulWidget {
  @override
  _AdminButtonState createState() => _AdminButtonState();
}

class _AdminButtonState extends State<AdminButton> {
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    bool isAdmin = await userStatus().checkAdminStatus(user!.uid);
    setState(() {
      _isAdmin = isAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isAdmin
          ? () {
            NotificationService.pushNotification(title: 'Admin button', body: 'You are an admin, this is why you are special and can press this button');
            }
          : null,
      child: Text('Admin only'),
      style: ElevatedButton.styleFrom(
        backgroundColor: _isAdmin ? null : Colors.grey,
      ),
    );
  }
}
