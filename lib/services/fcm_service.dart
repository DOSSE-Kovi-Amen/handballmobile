import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cahb/services/api_service.dart';
import 'package:http/http.dart' as http;

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> configureFirebase() async {
        await _firebaseMessaging.requestPermission();
    // Configurer la réception des messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message data: ${message.data}");
      print("Notification title: ${message.notification?.title}");
      print("Notification body: ${message.notification?.body}");
    });

    // Configurer la réception des messages lorsqu'on clique sur la notification en arrière-plan
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message data: ${message.data}");
      print("Notification title: ${message.notification?.title}");
      print("Notification body: ${message.notification?.body}");
    });

    // Configurer la réception des messages lorsqu'on clique sur la notification en avant-plan
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("Message data: ${message.data}");
        print("Notification title: ${message.notification?.title}");
        print("Notification body: ${message.notification?.body}");
      }
    });

    // Récupérer le token FCM et l'envoyer à votre endpoint
    String? token = await _firebaseMessaging.getToken();
    sendTokenToEndpoint(token);
  }

  void sendTokenToEndpoint(String? token) {
    // Remplacez cette partie par votre logique d'envoi HTTP vers votre endpoint
    // Utilisez une bibliothèque comme http.dart pour effectuer une requête HTTP
    // vers votre endpoint 'device/post' avec le token comme paramètre.

    // Par exemple avec http.dart :
    final res = http.post(Uri.parse('${ApiService.baseUrl}/api/device/post'),
        body: {'fcm_registration_token': token}).then((value) =>print(value.statusCode));
    print("FCM Token: $token");
  }
}
