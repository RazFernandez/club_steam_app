import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';

class RedirectTextButton extends StatelessWidget {
  final String labelText; // The text before the button
  final BuildContext context; // The current context
  final Widget targetView; // The view to navigate to
  final String buttonText; // The text on the button
  final bool clearStack; // Flag to indicate whether to clear the stack

  const RedirectTextButton({
    super.key,
    required this.labelText,
    required this.context,
    required this.targetView,
    required this.buttonText,
    this.clearStack = false, // Default is false (do not clear the stack)
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText), // Display the label text
        TextButton(
          onPressed: () {
            // Check if the stack should be cleared or not
            if (clearStack) {
              navigateAndClearStack(this.context, targetView);
            } else {
              navigateTo(this.context, targetView);
            }
          },
          child: Text(
            buttonText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
