import 'package:firebase_8_12/screens/home_screen.dart';
import 'package:firebase_8_12/screens/login_screen.dart';
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

  Future register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => Get.to(const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowMessage.showSnackbar(
          message: 'The password provided is too weak.',
          color: Colors.red,
        );
      } else if (e.code == 'email-already-in-use') {
        ShowMessage.showSnackbar(
          message: 'The account already exists for that email.',
          color: Colors.red,
        );
      }
    } catch (e) {
      ShowMessage.showSnackbar(
        message: e.toString(),
        color: Colors.red,
      );
    }
  }

  Future logout() async {
    auth.signOut();
  }
}
