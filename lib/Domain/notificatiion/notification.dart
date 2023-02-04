import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificatoinclass {
  static final mynotification = FlutterLocalNotificationsPlugin();

  static Future shownotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
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
      android: AndroidNotificationDetails('', '', importance: Importance.max),
      iOS: DarwinNotificationDetails(),
    );
  }
}
