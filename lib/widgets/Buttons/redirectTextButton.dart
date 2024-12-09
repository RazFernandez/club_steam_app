import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';

class RedirectTextButton extends StatelessWidget {
  final String labelText; // The text before the button
  final BuildContext context; // The current context
  final Widget targetView; // The view to navigate to
  final String buttonText; // The text on the button
  final int navigationMode; // 0 for stacking views, 1 for clearing the stack

  const RedirectTextButton({
    super.key,
    required this.labelText,
    required this.context,
    required this.targetView,
    required this.buttonText,
    this.navigationMode = 0, // Default is stacking views
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
            if (navigationMode == 1) {
              // Clear stack and navigate to the target view
              navigateAndClearStack(context, targetView);
            } else {
              // Stack the views with regular push
              navigateTo(context, targetView);
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
