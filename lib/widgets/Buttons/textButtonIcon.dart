import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback onPressed;

  const TextButtonIcon({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) Icon(leadingIcon, size: 18),
          if (leadingIcon != null) const SizedBox(width: 6),
          Text(label),
          if (trailingIcon != null) const SizedBox(width: 6),
          if (trailingIcon != null) Icon(trailingIcon, size: 18),
        ],
      ),
    );
  }
}
