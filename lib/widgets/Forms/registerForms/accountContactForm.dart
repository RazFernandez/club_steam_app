import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';

class AccountContactForm extends StatefulWidget {
  const AccountContactForm({super.key});

  @override
  State<AccountContactForm> createState() => _AccountContactFormState();
}

class _AccountContactFormState extends State<AccountContactForm> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Email field
          CustomFormField(
              labelText: "Correo",
              icon: AppIcons.emailIcon,
              validator: (value) => isValidEmail(value)),
          // Cell phone number field
          CustomFormField(
              labelText: "Número de Celular",
              icon: AppIcons.phoneIcon,
              validator: (value) => isValidPhoneNumber(value)),
        ],
      ),
    );
  }
}
