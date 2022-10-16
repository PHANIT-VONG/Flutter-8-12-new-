import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMessage {
  static showSnackbar({String? message, Color color = Colors.white}) {
    Get.snackbar(
      'Message Title',
      message ?? "message",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
    );
  }
}
