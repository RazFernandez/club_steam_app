import 'package:club_steam_app/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/utils/strings/verification_email_strings.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/widgets/Graphics/InfoCard.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:go_router/go_router.dart';

class VerificationEmailView extends StatefulWidget {
  final int? indexView;
  const VerificationEmailView({super.key, this.indexView});

  @override
  State<VerificationEmailView> createState() => _VerificationEmailViewState();
}

class _VerificationEmailViewState extends State<VerificationEmailView> {
  // Add a coldown to resend varification emails
  // add a paremeter to set the initial indexView

  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  // Index of the view to be displayed
  int indexView = 0;

  @override
  void initState() {
    super.initState();
    indexView = widget.indexView ?? 0;
  }

  // Instance of the authentication service
  AuthService authService = AuthService();

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

  // Method to validate account
  void _validateEmail() async {
    await authService.reloadUserData();
    bool emailValidated = await authService.checkEmailVerification();
    log(emailValidated.toString());
    setState(() {
      if (emailValidated) {
        indexView = 1;
      } else {
        indexView = 2;
      }
    });
  }

  // Method to send a validation email
  void _sendValidationEmail() async {
    await authService.sendEmailVerification();
    setState(() {
      //indexView = 0;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (indexView == 0)
                    SizableButton(
                        onPressed: () {
                          //_nextIndexView();
                          _validateEmail();
                        },
                        text: "Validar cuenta",
                        width: largeButtonSize,
                        typeOfButton: ButtonType.filledButton)
                  else if (indexView == 1)
                    SizableButton(
                        onPressed: () async {
                          //_nextIndexView();
                          //navigateAndClearStack(context, LoginView());
                          await authService.signout();
                          if (context.mounted) {
                            context.go("/login");
                          }
                          log('You did it!!!');
                        },
                        text: "Iniciar Sesión",
                        width: largeButtonSize,
                        typeOfButton: ButtonType.filledButton)
                  else if (indexView == 2)
                    Row(
                      children: [
                        SizableButton(
                            onPressed: () {
                              // _restartIndexView();
                              _sendValidationEmail();
                            },
                            text: "Reenviar",
                            width: smallButtonsSize,
                            typeOfButton: ButtonType.outlinedButton),
                        SizedBox(width: 24),
                        SizableButton(
                            onPressed: () {
                              //_nextIndexView();
                              _validateEmail();
                            },
                            text: "Validar",
                            width: smallButtonsSize,
                            typeOfButton: ButtonType.filledButton),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
