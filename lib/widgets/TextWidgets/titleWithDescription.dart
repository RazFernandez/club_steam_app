import 'package:flutter/material.dart';

class TitleWithDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleWithDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
