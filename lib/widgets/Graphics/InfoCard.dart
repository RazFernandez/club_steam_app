import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/strings/verification_email_strings.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';

class Infocard extends StatelessWidget {
  final String? title; // Optional title
  final String iconImageAsset; // Icon asset
  final String description;
  final double? heightImageAsset; // Optional description

  const Infocard({
    super.key,
    this.title,
    required this.iconImageAsset,
    required this.description,
    this.heightImageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null) TitleText(text: title!),
        SizedBox(height: 24),
        Image.asset(iconImageAsset, height: heightImageAsset ?? 200),
        SizedBox(height: 24),
        DescriptionText(text: description),
        SizedBox(height: 24),
      ],
    );
  }
}
