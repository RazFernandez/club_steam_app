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
          Theme.of(context).colorScheme.onError,
        );

  /// Constructor for success messages
  ToastManager.success(BuildContext context, String message)
      : this._(
          message,
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.onPrimary,
        );

  /// Constructor for informational messages
  ToastManager.info(BuildContext context, String message)
      : this._(
          message,
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.onSecondary,
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

