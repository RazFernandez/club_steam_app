import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:club_steam_app/providers/linearProgressBar_provider.dart';

class LinearProgressBar extends StatelessWidget {
  final double minHeight;
  final Color? color;
  final Color? backgroundColor;

  // Private constructor
  const LinearProgressBar._({
    Key? key,
    required this.minHeight,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  // Material-themed constructor
  LinearProgressBar.material({
    Key? key,
    required double minHeight,
    required BuildContext context,
  }) : this._(
          key: key,
          minHeight: minHeight,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        );

  @override
  Widget build(BuildContext context) {
    return Consumer<LinearProgressBarProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: minHeight,
          child: LinearProgressIndicator(
            value: provider.currentStep / provider.totalSteps,
            backgroundColor: backgroundColor,
            color: color,
          ),
        );
      },
    );
  }
}

// class LinearProgressBar extends StatefulWidget {
//   final int steps;
//   final double minHeight;
//   final Color? color;
//   final Color? backgroundColor;

//   // Private constructor
//   const LinearProgressBar._({
//     Key? key,
//     required this.steps,
//     required this.minHeight,
//     this.color,
//     this.backgroundColor,
//   }) : super(key: key);

//   // Material-themed constructor
//   LinearProgressBar.material({
//     Key? key,
//     required int steps,
//     required double minHeight,
//     required BuildContext context,
//   }) : this._(
//           key: key,
//           steps: steps,
//           minHeight: minHeight,
//           color: Theme.of(context).colorScheme.primary,
//           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
//         );

//   @override
//   State<LinearProgressBar> createState() => _LinearProgressBarState();
// }

// class _LinearProgressBarState extends State<LinearProgressBar> {
//   // Keeps track of the current value of the linear progress bar
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: widget.minHeight,
//         child: LinearProgressIndicator(
//           value: 1 / widget.steps,
//           backgroundColor: widget.backgroundColor,
//           color: widget.color,
//         ));
//   }
// }
