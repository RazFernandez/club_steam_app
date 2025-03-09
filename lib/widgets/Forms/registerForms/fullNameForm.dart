import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';

class Fullnameform extends StatefulWidget {
  const Fullnameform({super.key});

  @override
  State<Fullnameform> createState() => _FullnameformState();
}

class _FullnameformState extends State<Fullnameform> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Nombre completo";
  final String _formDescription =
      "Escribe tu nombre, apellido paterno y apellido materno como aparecen en tus documentos.";
  final String _firstNameLabel = "Nombres";
  final String _fatherLastNameLabel = "Apellido Paterno";
  final String _motherLastNameLabel = "Apellido Materno";

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
          // Name field
          CustomFormField(
              labelText: _firstNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          SizedBox(height: 16),
          // Father Last name
          CustomFormField(
              labelText: _fatherLastNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          SizedBox(height: 16),
          // Mother Last name
          CustomFormField(
              labelText: _motherLastNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
        ],
      ),
    );
  }
}
