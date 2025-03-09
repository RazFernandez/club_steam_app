import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';

class AccountContactForm extends StatefulWidget {
  const AccountContactForm({super.key});

  @override
  State<AccountContactForm> createState() => _AccountContactFormState();
}

class _AccountContactFormState extends State<AccountContactForm> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Datos de contacto";
  final String _formDescription =
      "Escribe tu correo y número de celular para asociarlos a tu cuenta.";
  final String _emailLabel = "Correo";
  final String _cellphoneNumberLabel = "Número de Celular";

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
          // Email field
          CustomFormField(
              labelText: _emailLabel,
              icon: AppIcons.emailIcon,
              validator: (value) => isValidEmail(value)),
          // Cell phone number field
          CustomFormField(
              labelText: _cellphoneNumberLabel,
              icon: AppIcons.phoneIcon,
              validator: (value) => isValidPhoneNumber(value)),
        ],
      ),
    );
  }
}
