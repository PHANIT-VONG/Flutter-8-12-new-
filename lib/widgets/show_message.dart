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

  static Future<void> showLoading(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 15.0),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }
}
