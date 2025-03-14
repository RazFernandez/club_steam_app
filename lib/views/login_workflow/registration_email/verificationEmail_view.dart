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

  // Visibility of the buttons (Initial state)
  bool isButtonValidarCuentaVisible = true;
  bool isButtonIniciarSesionVisible = false;
  bool isButtonReenviarCorreoVisible = false;

  // Widgets to be displayed (Images)
  final Widget emailIcon =
      Image.asset('lib/assets/imgs/Email_Icon.png', height: 200);

  final Widget checkIcon =
      Image.asset('lib/assets/imgs/Check_Icon.png', height: 200);

  final Widget errorIcon =
      Image.asset('lib/assets/imgs/Error_Icon.png', height: 200);

  // Method to set the visibility of the images

  // Method to set the visibility of the buttons
  void _setButtonVisibility() {
    setState(() {
      switch (indexView) {
        case 0:
          isButtonValidarCuentaVisible = true;
          isButtonIniciarSesionVisible = false;
          isButtonReenviarCorreoVisible = false;
          break;
        case 1:
          isButtonValidarCuentaVisible = false;
          isButtonIniciarSesionVisible = true;
          isButtonReenviarCorreoVisible = false;
          break;
        case 2:
          isButtonValidarCuentaVisible = false;
          isButtonIniciarSesionVisible = false;
          isButtonReenviarCorreoVisible = true;
          break;
        default:
          log("The index is not valid");
      }
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
              IndexedStack(
                index: indexView,
                children: [
                  Infocard(
                      title: 'Correo Enviado',
                      iconImageAsset: 'lib/assets/imgs/Email_Icon.png',
                      description: emailVerificationDescription),
                  checkIcon,
                  errorIcon,
                ],
              ),
              SizableButton(
                  onPressed: () {},
                  text: "Reenviar correo",
                  width: largeButtonSize,
                  typeOfButton: ButtonType.filledButton),
            ],
          ),
        ),
      ),
    );
  }
}
