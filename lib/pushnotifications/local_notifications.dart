import 'dart:io';

import '/comman/global_var.dart';
import '/comman/utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '/extras/storage.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static String notificationMsg = "";

  static Future<void> initilize() async {
    NotificationSettings settings =
        await _firebaseMessaging.getNotificationSettings();
    print(settings.authorizationStatus);
    print(settings.authorizationStatus != AuthorizationStatus.authorized);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else {
      if (Platform.isAndroid) {
        await FlutterLocalNotificationsPlugin()
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(const AndroidNotificationChannel(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              description:
                  'This channel is used for important notifications.', // description
              importance: Importance.high,
            ));
      }
      await _firebaseMessaging.requestPermission(
        announcement: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
        badge: true,
        alert: true,
      );
    }

    try {
      final _pnsKey = await _firebaseMessaging.getToken();
      storage.setStorgeKeyValue("pnsKey", _pnsKey.toString());
      print("local notification pns key ${_pnsKey.toString()}");

      GlobalValues.pnsKey = _pnsKey.toString();
    } catch (e, stacktTace) {
      debugPrint('getting error with $e \n $stacktTace');
    }

    const InitializationSettings initilizationSettings = InitializationSettings(
        android: AndroidInitializationSettings("mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings());

    _notificationsPlugin.initialize(
      initilizationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        print("initialize notification ----> ${notificationResponse.payload}");
      },

      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // headsup notification in IOS
      badge: true,
      sound: true,
    );
    _firebaseMessaging.getInitialMessage().then((message) {
      print(message);
      debugPrint('Notification 1 --->>>>>>${message?.data}');
      if (message != null) {
        notificationMsg =
            "${message.data['Notid'] ?? ""}${message.data['message'] ?? ""} notification is comingg from terminated state";
      }
    });
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint(
          'Notification 4 (on message) forground --->>>>>> ${message.data}}');

      if (message.notification != null) {
        await LocalNotification.showNotificationOnForeground(message);
        notificationMsg =
            "${message.data['message'] ?? ""}${message.data['Notid'] ?? ""} notification is comingg from  foreground";
        print(notificationMsg);
      }
    }).onError((error, stackTrace) {
      print("onMessage error $error stackTrace $stackTrace");
    });
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        print("on open app $message");
        notificationMsg =
            "${message.data['Notid'] ?? ""}${message.data['message'] ?? ""} notification is comingg from background";
        print(notificationMsg);
      },
    ).onError((error, stackTrace) {
      print("onMessageOpenedApp error $error stackTrace $stackTrace");
    });
  }

  static Future<void> showNotificationOnForeground(
      RemoteMessage message) async {
    debugPrint("notification data ${message.notification}");
    debugPrint("notification data ${message.data['message'] ?? ""}");
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "aom.apghproject", "APGH",
        importance: Importance.max, priority: Priority.high);

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
            // categoryIdentifier: 'plainCategory',
            );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    print("herre--->>");
    await _notificationsPlugin
        .show(0, message.notification?.title ?? "",
            message.notification?.body ?? "", platformChannelSpecifics,
            payload: 'Default_Sound')
        // .show(0, message.data['NotType'] ?? "Null",
        //     message.data['message'] ?? "Null", platformChannelSpecifics,
        //     payload: 'Default_Sound')
        .catchError((onError, s) {
      print("errpr $onError ssss $s");
    }).then((value) => print("====++++++"));
    //  DialogBox().errorMsgDialog(message, "");
  }
}
