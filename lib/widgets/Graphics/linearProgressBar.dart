import 'package:flutter/material.dart';

class LinearProgressBar extends StatefulWidget {
  final int steps;
  final double minHeight;
  final Color? color;
  final Color? backgroundColor;

  // Private constructor
  const LinearProgressBar._({
    Key? key,
    required this.steps,
    required this.minHeight,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  // Material-themed constructor
  LinearProgressBar.material({
    Key? key,
    required int steps,
    required double minHeight,
    required BuildContext context,
  }) : this._(
          key: key,
          steps: steps,
          minHeight: minHeight,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        );

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  // Keeps track of the current value of the linear progress bar
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.minHeight,
        child: LinearProgressIndicator(
          value: 1 / widget.steps,
          backgroundColor: widget.backgroundColor,
          color: widget.color,
        ));
  }
}
