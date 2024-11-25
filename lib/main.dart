import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:live_score_app/app.dart';
import 'package:live_score_app/firebase_notification_manager.dart';
import 'package:live_score_app/flutter_local_notification_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationManager.initialize();
  await FlutterLocalNotificationManager.initialize();

  print(await FirebaseNotificationManager.getFcmToken());

  runApp(const LiveScoreApp());
}