import 'package:flutter/material.dart';

enum AppTextStyleType {
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class TextWithDivider extends StatelessWidget {
  final String text;
  final AppTextStyleType textStyleType;

  const TextWithDivider({
    super.key,
    required this.text,
    this.textStyleType = AppTextStyleType.bodyMedium, // Default Value
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = _getTextStyleFromTheme(textTheme, textStyleType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        const SizedBox(height: 4),
        const Divider(),
      ],
    );
  }

  TextStyle? _getTextStyleFromTheme(TextTheme theme, AppTextStyleType type) {
    switch (type) {
      case AppTextStyleType.titleLarge:
        return theme.titleLarge;
      case AppTextStyleType.titleMedium:
        return theme.titleMedium;
      case AppTextStyleType.titleSmall:
        return theme.titleSmall;
      case AppTextStyleType.bodyLarge:
        return theme.bodyLarge;
      case AppTextStyleType.bodyMedium:
        return theme.bodyMedium;
      case AppTextStyleType.bodySmall:
        return theme.bodySmall;
      case AppTextStyleType.displayLarge:
        return theme.displayLarge;
      case AppTextStyleType.displayMedium:
        return theme.displayMedium;
      case AppTextStyleType.displaySmall:
        return theme.displaySmall;
      case AppTextStyleType.headlineLarge:
        return theme.headlineLarge;
      case AppTextStyleType.headlineMedium:
        return theme.headlineMedium;
      case AppTextStyleType.headlineSmall:
        return theme.headlineSmall;
      case AppTextStyleType.labelLarge:
        return theme.labelLarge;
      case AppTextStyleType.labelMedium:
        return theme.labelMedium;
      case AppTextStyleType.labelSmall:
        return theme.labelSmall;
    }
  }
}
