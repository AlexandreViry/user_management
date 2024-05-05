import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() {
    _notification.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings()
    ));
  }

  static pushNotification({required String title, required String body}) async {
    var iosDetails = const DarwinNotificationDetails();
    var androidDetails = const AndroidNotificationDetails('channel_1', 'My channel', importance: Importance.max, priority: Priority.high);
    var notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
    _notification.show(20, title, body, notificationDetails);
  }
}