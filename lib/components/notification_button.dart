import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Functions for the notification system
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  /// Called by main, it initialize the notifications
  static init() {
    _notification.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('logo'),
      iOS: DarwinInitializationSettings(),
    ),);
  }

  /// Sends a notification to the user 
  static void pushNotification({required String title, required String body}) {
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails('channel_1', 'My channel', importance: Importance.max, priority: Priority.high);
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
    _notification.show(20, title, body, notificationDetails);
  }
}
