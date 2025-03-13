import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';

class AccountContactForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AccountContactForm({super.key, required this.formKey});

  @override
  State<AccountContactForm> createState() => _AccountContactFormState();
}

class _AccountContactFormState extends State<AccountContactForm> {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Datos de contacto";
  final String _formDescription =
      "Escribe tu correo y número de celular para asociarlos a tu cuenta.";
  final String _emailLabel = "Correo";
  final String _cellphoneNumberLabel = "Número de Celular";

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
          // Email field
          CustomFormField(
              controller: registrationUserFormData.emailController,
              labelText: _emailLabel,
              icon: AppIcons.emailIcon,
              validator: (value) => isValidEmail(value)),
          // Cell phone number field
          CustomFormField(
              controller: registrationUserFormData.cellPhoneNumberController,
              labelText: _cellphoneNumberLabel,
              icon: AppIcons.phoneIcon,
              validator: (value) => isValidPhoneNumber(value)),
        ],
      ),
    );
  }
}
