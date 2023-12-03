import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/app/modules/home/views/firebase_api.dart';
import 'package:modul3/app/modules/home/views/homepage.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart'; // Pastikan firebase_options.dart berada di lokasi yang benar
import 'package:firebase_core/firebase_core.dart';
import 'package:appwrite/appwrite.dart';

Client client = Client();
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6566b7b9f027df3a02c7')
      .setSelfSigned(status: true);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      routes: {
        '/notification_screen': (context) => const HomePage(),
      },
    ),
  );
}
