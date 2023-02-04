import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificatoinclass {
  final mynotification = FlutterLocalNotificationsPlugin();
  void init() {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    mynotification.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future shownotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      mynotification}) async {
    log('fghjkl');

    mynotification.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payload,
    );
  }

  static Future notificationDetails() async {
    log('fgh');
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        '',
        '',
        importance: Importance.max,
        icon: 'cvb',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('');
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) {
    print('object');
  }
}
