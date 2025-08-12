import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // Initialize notification settings and listeners
  static Future<void> initialize() async {
    // Request permission for iOS
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a foreground message:");
      print("Message data: ${message.data}");

      if (message.notification != null) {
        print("Message contains a notification: ${message.notification}");
      }
    });

    // Listen for messages when the app is in the background or terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message opened from background or terminated:");
      print("Message data: ${message.data}");
    });

    // Handle initial message if the app was terminated and opened via a notification
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      print("App opened from terminated state by notification:");
      print("Message data: ${initialMessage.data}");
    }

    // Optionally, print the FCM token for testing
    String? token = await _messaging.getToken();
    print("FCM Token: $token");
  }
}
