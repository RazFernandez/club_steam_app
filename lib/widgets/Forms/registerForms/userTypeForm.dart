import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/TextFields/dropdownFormField.dart';
import 'package:club_steam_app/utils/dropdown_items.dart';
import 'package:club_steam_app/widgets/PlainText/titleText.dart';
import 'package:club_steam_app/widgets/PlainText/descriptionText.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';

class UserTypeForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const UserTypeForm({super.key, required this.formKey});

  @override
  State<UserTypeForm> createState() => _UserTypeFormState();
}

class _UserTypeFormState extends State<UserTypeForm> {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Variables to hold selected dropdown values
  String? _selectedUserType;
  String? _selectedUnit;

  // Variables to hold the text for the form labels and descriptions
  final String _formTitle = "Tu rol en Club STEAM";
  final String _formDescription =
      "Elige el tipo de usuario que mejor te describa.";

  /*
  =========================
  Method to render textfields according to the user type
  =========================
  */
  Widget _renderContentFields(String? userType) {
    if (userType == 'Docente' || userType == 'Estudiante') {
      return Column(
        children: [
          DropdownFormField<String>(
            labelText: 'Ingenieria',
            icon: AppIcons.engineeringIcon,
            items: ingenieriaOptions,
            value: _selectedUnit,
            controller: registrationUserFormData.unitController,
            validator: (value) => isValidMultiOptionField(value),
          ),
          // Just the Estudiantes request their control number
          if (userType == 'Estudiante')
            CustomFormField(
              labelText: 'Número de Control',
              icon: AppIcons.controlNumIcon,
              controller: registrationUserFormData.controlNumberController,
              validator: (value) => isValidControlNumber(value),
            )
        ],
      );
      // Instead of their ingenieria, the collaborators request their unidad administrativa
    } else if (userType == 'Colaborador') {
      return DropdownFormField<String>(
        labelText: 'Unidad Administrativa',
        icon: AppIcons.unidadAdminIcon,
        items: unidadAdministrativaOptions,
        value: _selectedUnit,
        controller: registrationUserFormData.unitController,
        validator: (value) => isValidMultiOptionField(value),
      );
    }
    return SizedBox.shrink();
  }

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
          // Type of user field
          DropdownFormField<String>(
            labelText: 'Tipo de usuario',
            icon: AppIcons.typeUserIcon,
            items: userTypes,
            value: _selectedUserType,
            controller: registrationUserFormData.userTypeController,
            validator: (value) => isValidMultiOptionField(value),
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ), // Rendering content fields based on user type
          _renderContentFields(_selectedUserType),
        ],
      ),
    );
  }
}
