import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:universal_html/html.dart' as html;

class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() {
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('logo'),
        iOS: DarwinInitializationSettings()));
  }

  static pushNotification({required String title, required String body}) async {
    if (html.Notification.permission == 'granted') {
      html.Notification(title, body: body);
    } else if (html.Notification.permission != 'denied') {
      html.Notification.requestPermission().then((permission) {
        if (permission == 'granted') {
          html.Notification(title, body: body);
        }
      });
    } else {
      var iosDetails = const DarwinNotificationDetails();
      var androidDetails = const AndroidNotificationDetails(
          'channel_1', 'My channel',
          importance: Importance.max, priority: Priority.high);
      var notificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);
      _notification.show(20, title, body, notificationDetails);
    }
  }
}
