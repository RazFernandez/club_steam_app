import 'package:flutter/material.dart';

// This function let's the app navigate into another view
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

// This function handles the behavior of the back navigation for a multi-step form.
void handleBackNavigation(
    BuildContext context, int currentPage, Function updatePage) {
  if (currentPage == 0) {
    Navigator.pop(context); // Close the current view if on the first page
  } else {
    updatePage(0); // Reset to the first page of the form if on a later page
  }
}
