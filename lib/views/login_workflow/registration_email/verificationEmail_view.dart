import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/utils/strings/verification_email_strings.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/Graphics/InfoCard.dart';

class VerificationemailView extends StatefulWidget {
  const VerificationemailView({super.key});

  @override
  State<VerificationemailView> createState() => _VerificationemailViewState();
}

class _VerificationemailViewState extends State<VerificationemailView> {
  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  // Index of the view to be displayed
  int indexView = 0;

  // Method to increase the index of the view
  void _nextIndexView() {
    setState(() {
      if (indexView < 2) {
        indexView++;
      }
    });
  }

  // Method to decrease the index of the view
  void _previousIndexView() {
    setState(() {
      if (indexView > 0) {
        indexView--;
      }
    });
  }

  // Method to restart the index of the view
  void _restartIndexView() {
    setState(() {
      indexView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verificación de correo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (indexView == 0)
                Infocard(
                    title: emailVerificationTitle,
                    iconImageAsset: 'lib/assets/imgs/Email_Icon.png',
                    description: emailVerificationDescription),
              if (indexView == 1)
                Infocard(
                    title: accountVerifiedTitle,
                    iconImageAsset: 'lib/assets/imgs/Check_Icon.png',
                    description: accountVerifiedDescription),
              if (indexView == 2)
                Infocard(
                    title: accountNotVerifiedTitle,
                    iconImageAsset: 'lib/assets/imgs/Error_Icon.png',
                    description: accountNotVerifiedDescription),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (indexView == 0)
                    SizableButton(
                        onPressed: () {
                          _nextIndexView();
                        },
                        text: "Validar cuenta",
                        width: largeButtonSize,
                        typeOfButton: ButtonType.filledButton)
                  else if (indexView == 1)
                    SizableButton(
                        onPressed: () {
                          _nextIndexView();
                        },
                        text: "Iniciar Sesión",
                        width: largeButtonSize,
                        typeOfButton: ButtonType.filledButton)
                  else if (indexView == 2)
                    SizableButton(
                        onPressed: () {
                          _restartIndexView();
                        },
                        text: "Reenviar correo",
                        width: largeButtonSize,
                        typeOfButton: ButtonType.filledButton)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
