import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/View/SplashScreen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Notification_Service/Notification_Service.dart';
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// This function handles background and terminated notifications
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message received: ${message.messageId}");
  // You can handle background notifications here
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  Get.put(CommonContoller());
  var directory  = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(ScreenUtilInit(
    builder:  (_,child){
      return  GetMaterialApp(
        theme: ThemeData(
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Color(0xFF0DB0F4),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white
          ),
          scaffoldBackgroundColor: Colors.white
        ),
        home: SplashScreen(),
      );
  },

  ));
}


