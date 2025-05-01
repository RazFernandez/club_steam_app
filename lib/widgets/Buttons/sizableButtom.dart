import 'package:flutter/material.dart';

enum ButtonType {
  elevatedButton,
  filledButton,
  outlinedButton,
  textButton,
}

class SizableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final ButtonType typeOfButton;
  final bool isEnabled; // Optional parameter to enable/disable the button

  const SizableButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.typeOfButton,
    this.isEnabled = true, // Default: enabled
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    final VoidCallback? callback = isEnabled ? onPressed : null;

    switch (typeOfButton) {
      case ButtonType.elevatedButton:
        return ElevatedButton(onPressed: callback, child: Text(text));
      case ButtonType.filledButton:
        return FilledButton(onPressed: callback, child: Text(text));
      case ButtonType.outlinedButton:
        return OutlinedButton(onPressed: callback, child: Text(text));
      case ButtonType.textButton:
        return TextButton(onPressed: callback, child: Text(text));
      default:
        return ElevatedButton(onPressed: callback, child: Text(text));
    }
  }
}
