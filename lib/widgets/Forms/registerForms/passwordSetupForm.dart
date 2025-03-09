import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/utils/validation.dart';

class PasswordSetupForm extends StatefulWidget {
  const PasswordSetupForm({super.key});

  @override
  State<PasswordSetupForm> createState() => _PasswordSetupFormState();
}

class _PasswordSetupFormState extends State<PasswordSetupForm> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
