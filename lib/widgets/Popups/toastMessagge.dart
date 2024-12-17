import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager {
  final String message;
  final Color backgroundColor;
  final Color textColor;

  // Private constructor
  ToastManager._(this.message, this.backgroundColor, this.textColor);

  /// Constructor for error messages
  ToastManager.error(BuildContext context, String message)
      : this._(
          message,
          Theme.of(context).colorScheme.error,
          Colors.white,
        );

  /// Constructor for informational messages
  ToastManager.info(BuildContext context, String message)
      : this._(
          message,
          Theme.of(context).colorScheme.secondary,
          Colors.white,
        );

  /// Show the toast message
  void show() {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}

// Usage example:
// ToastManager.error("Error saving user data: Some error message").show();
// ToastManager.info("Informative message here").show();

