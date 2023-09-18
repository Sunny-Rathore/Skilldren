// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> initializeNotifications() async {
  var androidSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  var iOSsettings = const IOSInitializationSettings();
  var initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iOSsettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> scheduleNotification() async {
  // final bigPicture = await Utils.downloadFile(
  //     "https://images.unsplash.com/photo-1624948465027-6f9b51067557?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  //     "drinkwater");
  var androidNotificationDetails = const AndroidNotificationDetails(
    'your channel id', 'your channel name', 'your channel description',
    importance: Importance.max,
    priority: Priority.max,
    ticker: 'ticker',
    playSound: true,
    visibility: NotificationVisibility.public,
    enableVibration: true,
    //  largeIcon: FilePathAndroidBitmap(bigPicture),
    // styleInformation:
    //     BigPictureStyleInformation(FilePathAndroidBitmap(filePath))
  );
  var iOSNotificationDetails = const IOSNotificationDetails();
  var notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: iOSNotificationDetails);
  await flutterLocalNotificationsPlugin.schedule(
    0,
    'Draw A duck',
    'Time to Draw A Duck!',
    DateTime.now().add(const Duration(microseconds: 10)),
    notificationDetails,
    payload: 'item x',
  );
}

class Utils {
  static Future<String> downloadFile(String url, String fileName) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$fileName';

    final file = File(filePath);
    final response = await http.get(Uri.parse(url));
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
