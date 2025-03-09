import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';

class PasswordSetupForm extends StatefulWidget {
  const PasswordSetupForm({super.key});

  @override
  State<PasswordSetupForm> createState() => _PasswordSetupFormState();
}

class _PasswordSetupFormState extends State<PasswordSetupForm> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Protege tu cuenta";
  final String _formDescription =
      "Crea una contraseña segura combinando letras, numeros y simbolos.";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          TitleText(text: _formTitle),
          SizedBox(height: 16),
          DescriptionText(text: _formDescription),
          SizedBox(height: 16),
          // Password field
          PasswordFormField(
              labelText: "Contraseña",
              validator: (value) => isValidPassword(value)),
          PasswordFormField(
              labelText: "Confirmar Contraseña",
              validator: (value) => validatePasswords("xd", "xd")),
        ],
      ),
    );
  }
}
