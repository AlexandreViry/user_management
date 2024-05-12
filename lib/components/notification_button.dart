import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:universal_html/html.dart' as html;

/// Notification for web and mobile
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  /// Constructor
  static void init() {
    // ignore: discarded_futures
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('logo'),
        iOS: DarwinInitializationSettings(),),);
  }
  /// when called will push the notification to the device
  static Future<void> pushNotification({required String title, required String body}) async {
    if (html.Notification.permission == 'granted') {
      html.Notification(title, body: body);
    } else if (html.Notification.permission != 'denied') {
      // ignore: unawaited_futures
      html.Notification.requestPermission().then((String permission) {
        if (permission == 'granted') {
          html.Notification(title, body: body);
        }
      });
    } else {
      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
          'channel_1', 'My channel',
          importance: Importance.max, priority: Priority.high,);
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);
      await _notification.show(20, title, body, notificationDetails);
    }
  }
}
