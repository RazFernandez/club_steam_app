import 'package:flutter/material.dart';

class SizableButtom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;

  const SizableButtom({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
