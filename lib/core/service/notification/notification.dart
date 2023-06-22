//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// class Notifications{
//   Future init() async => Notifications._initialize(flutterLocalNotificationsPlugin);
//   Future showNotification({required int id,required String title,required String body})=> _showBigTextNotification(id: id,title: title, body: body, fln: flutterLocalNotificationsPlugin);
//   static Future _initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.pendingNotificationRequests();
//     flutterLocalNotificationsPlugin.initialize(const InitializationSettings(android:  AndroidInitializationSettings('mipmap/launcher_icon'),
//         iOS: IOSInitializationSettings()),
//         onSelectNotification: (payload) async{
//
//           // Global.type="stock_request";
//           // Global.navigatorKey.currentState!.pushNamed('/stock_request');
//         });
//   }
//   static Future _showBigTextNotification({required int id ,required String title, required String body, required FlutterLocalNotificationsPlugin fln} ) async =>
//       await fln.show(id, title, body,
//             const NotificationDetails(android: AndroidNotificationDetails(
//             'you_can_name_it_whatever1',
//             'channel_name',
//             'Received Notification ',
//             playSound: true,
//             icon: "mipmap/launcher_icon",
//             importance: Importance.max,
//             priority: Priority.high,
//           ),
//             iOS:IOSNotificationDetails(sound: 'assets/audio/notification_sound.wav'),
//           ) );
// }
