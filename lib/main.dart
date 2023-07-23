import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsburst/Views/auth/signup_screen.dart';
import 'package:newsburst/Views/home_screen.dart';
import 'package:newsburst/Views/splash_screen.dart';

import 'Views/auth/login_screen.dart';
import 'controller/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFireBase();
  runApp(const MyApp());
}

_initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(Auth());
    print('firebase initialized');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'News Burst',
      home: const SplashScreen(),
    );
  }
}
