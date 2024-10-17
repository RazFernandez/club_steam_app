import 'package:flutter/material.dart';

// This fucntion let's the app navigate into another view
void navigateTo(BuildContext context, Widget view) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => view),
  );
}

// This function navigates to a view and removes all previous routes
void navigateAndClearStack(BuildContext context, Widget view) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => view),
    (Route<dynamic> route) => false, // This removes all previous routes
  );
}
