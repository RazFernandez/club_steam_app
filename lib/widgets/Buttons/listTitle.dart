import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? thirdLine;
  final bool enableSubtitle;
  final bool enableThirdLine;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final bool isDense;

  const ListTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.thirdLine,
    this.enableSubtitle = false,
    this.enableThirdLine = false,
    this.isDense = false,
    this.onTap,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: enableSubtitle
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null) Text(subtitle!),
                if (enableThirdLine && thirdLine != null) Text(thirdLine!),
              ],
            )
          : null,
      isThreeLine: enableSubtitle && enableThirdLine,
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      dense: isDense,
    );
  }
}
