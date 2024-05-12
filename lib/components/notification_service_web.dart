import 'dart:html' as html;

class NotificationService {
  static void pushNotification({required String title, required String body}) {
    if (html.Notification.permission == "granted") {
      html.Notification(title, body: body);
    } else if (html.Notification.permission != "denied") {
      html.Notification.requestPermission().then((permission) {
        if (permission == 'granted') {
          html.Notification(title, body: body);
        }
      });
    }
  }
}
