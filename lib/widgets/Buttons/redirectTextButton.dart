import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigationType { stack, clearStack }

class RedirectTextButton extends StatelessWidget {
  final String labelText; // The text before the button
  final String targetRoute; // The view to navigate to
  final String buttonText; // The text on the button
  final NavigationType navigationMode; // Enum for navigation mode

  const RedirectTextButton({
    super.key,
    required this.labelText,
    required this.targetRoute,
    required this.buttonText,
    this.navigationMode = NavigationType.stack, // Default is stacking views
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText), // Display the label text
        TextButton(
          onPressed: () {
            // Check the navigationMode to decide the navigation method
            if (navigationMode == NavigationType.clearStack) {
              // Clear stack and navigate to the target view
              //navigateAndClearStack(context, targetView);
              context.go(targetRoute);
            } else {
              // Stack the views with regular push
              context.push(targetRoute);
            }
          },
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
