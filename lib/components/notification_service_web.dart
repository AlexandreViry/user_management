import 'dart:html' as html;

/// Notification for web application
class NotificationService {
  /// Check if the user allowed notifications to send one
  static void pushNotification({required String title, required String body}) {
    if (html.Notification.permission == 'granted') {
      html.Notification(title, body: body);
    } else if (html.Notification.permission != 'denied') {
      html.Notification.requestPermission().then((String permission) {
        if (permission == 'granted') {
          html.Notification(title, body: body);
        }
      });
    }
  }
}
