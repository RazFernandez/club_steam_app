import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';

class RedirectTextButton extends StatelessWidget {
  final String labelText; // The text before the button
  final BuildContext context; // The current context
  final Widget targetView; // The view to navigate to
  final String buttonText; // The text on the button

  const RedirectTextButton({
    super.key,
    required this.labelText,
    required this.context,
    required this.targetView,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText), // Display the label text
        TextButton(
          onPressed: () {
            navigateAndClearStack(
                context, targetView); // Navigate to the target view
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
