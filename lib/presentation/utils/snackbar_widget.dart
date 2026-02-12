import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._(); 

  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = const Color.fromARGB(221, 86, 86, 86),
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = ScaffoldMessenger.of(context);


    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => messenger.hideCurrentSnackBar(),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }


  static void success(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.green.shade600,
    );
  }


  static void error(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.red.shade600,
    );
  }


  static void info(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.blue.shade600,
    );
  }
}
