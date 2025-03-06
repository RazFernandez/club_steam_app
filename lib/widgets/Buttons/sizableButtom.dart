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

  const SizableButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.typeOfButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    switch (typeOfButton) {
      case ButtonType.elevatedButton:
        return ElevatedButton(onPressed: onPressed, child: Text(text));
      case ButtonType.filledButton:
        return FilledButton(onPressed: onPressed, child: Text(text));
      case ButtonType.outlinedButton:
        return OutlinedButton(onPressed: onPressed, child: Text(text));
      case ButtonType.textButton:
        return TextButton(onPressed: onPressed, child: Text(text));
      default:
        return ElevatedButton(onPressed: onPressed, child: Text(text));
    }
  }
}
