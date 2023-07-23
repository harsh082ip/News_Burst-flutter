import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsburst/Views/auth/login_screen.dart';
import 'package:newsburst/Views/home_screen.dart';
import 'package:newsburst/models/users.dart';

class Auth extends GetxController {
  static Auth instance = Get.find();
  void Signup(String name, String email, String password) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        log(email);
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        myUser myuser =
            myUser(email: email, name: name, uid: credential.user!.uid);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(myuser.toJson())
            .then((value) {
          Get.snackbar('User Registered', 'Successful');
          Get.to(LoginScreen());
        });
      } else {
        Get.snackbar('Error', 'Some Error occured');
      }
    } catch (e) {
      log(e.toString());

      Get.snackbar('Error', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Congrats', 'Login Successful');
          Get.to(const HomePage());
        });
      } else {
        Get.snackbar('Error', 'Enter all the required details');
      }
    } catch (e) {
      Get.snackbar('Error Signing in', e.toString());
    }
  }
}
