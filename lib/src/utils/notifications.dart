import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

StreamController<String> selectNotificationSubject;

Future<void> setupNotifs() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      GetIt.I.get();

  if (selectNotificationSubject != null &&
      !selectNotificationSubject.isClosed) {
    selectNotificationSubject.close();
  }
  selectNotificationSubject = StreamController<String>.broadcast();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
      selectNotificationSubject.add(payload);
    } else {
      debugPrint('no notificaiton payload');
    }
  });
}

Future<void> showNotification(
    {String payload = NotifPayloads.openAcao, String body = ''}) async {
  final String title = "Mãos Unidas";
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          onlyAlertOnce: false,
          visibility: NotificationVisibility.public,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await GetIt.I
      .get<FlutterLocalNotificationsPlugin>()
      .show(0, title, body, platformChannelSpecifics, payload: payload);
}

class NotifPayloads {
  static const String openAcao = 'open_acao';
}
