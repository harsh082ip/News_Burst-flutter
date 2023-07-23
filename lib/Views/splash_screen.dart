import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsburst/Views/auth/login_screen.dart';
import 'package:newsburst/Views/auth/signup_screen.dart';
import 'package:newsburst/Views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      User? user = FirebaseAuth.instance.currentUser;
      user != null ? Get.to(const HomePage()) : Get.to(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 132, 105),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app_icon.png',
                      width: 150.0,
                      height: 180.0,
                    ),
                  ]),
            ),
          ),
          const Text(
            'Made in India 💖',
            style: TextStyle(
                fontSize: 25.0, fontFamily: 'Pacifico', color: Colors.white),
          ),
        ],
      ),
    );
  }
}
