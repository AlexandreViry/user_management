import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    initNotification();
  }

  Future<void> initNotification() async {
    print('Initialisation de la notification...');

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('um_logo');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        print('Notification reçue : id=$id, title=$title, body=$body, payload=$payload');
      },
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(initializationSettings);

    await createNotificationChannel();
  }

  Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'your_channel_id',
      'High Importance Notifications',
      importance: Importance.high,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  NotificationDetails notificationDetails() {
    print('Récupération des détails de la notification...');
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    final DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    print('Détails de la notification récupérés');
    return NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    print('Affichage de la notification : id=$id, title=$title, body=$body, payload=$payload');
    await notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payload,
    );
    print('Notification affichée avec succès');
  }

  Future<void> showImageNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    String? imageUrl,
  }) async {
    print('Affichage de la notification avec image : id=$id, title=$title, body=$body, payload=$payload, imageUrl=$imageUrl');
    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(imageUrl ?? 'logo.png'),
      largeIcon: FilePathAndroidBitmap(imageUrl ?? 'logo.png'),
      contentTitle: title,
      summaryText: body,
    );

    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      styleInformation: bigPictureStyleInformation,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
    print('Notification avec image affichée avec succès');
  }
}