import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/TextWidgets/titleText.dart';
import 'package:club_steam_app/widgets/TextWidgets/descriptionText.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';

class PasswordSetupForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PasswordSetupForm({super.key, required this.formKey});

  @override
  State<PasswordSetupForm> createState() => _PasswordSetupFormState();
}

class _PasswordSetupFormState extends State<PasswordSetupForm> {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Protege tu cuenta";
  final String _formDescription =
      "Crea una contraseña segura combinando letras, numeros y simbolos.";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
              controller: registrationUserFormData.passwordController,
              labelText: "Contraseña",
              validator: (value) => isValidPassword(value)),
          PasswordFormField(
              controller: registrationUserFormData.confirmPasswordController,
              labelText: "Confirmar Contraseña",
              validator: (value) => validatePasswords(
                  registrationUserFormData.password,
                  registrationUserFormData.confirmPassword)),
        ],
      ),
    );
  }
}
