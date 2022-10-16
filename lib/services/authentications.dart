import 'package:firebase_8_12/screens/home_screen.dart';
import 'package:firebase_8_12/widgets/show_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutheticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future login(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.offAll(const HomeScreen());
        debugPrint('Log in successful...!');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowMessage.showSnackbar(
          message: 'No user found for that email.',
          color: Colors.red,
        );
      } else if (e.code == 'wrong-password') {
        ShowMessage.showSnackbar(
          message: 'Wrong password provided for that user.',
          color: Colors.red,
        );
      }
    }
  }

  Future logout() async {
    auth.signOut();
  }
}
