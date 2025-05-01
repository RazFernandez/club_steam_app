import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';
import 'package:club_steam_app/controllers/user_controller.dart';

class EditAccountForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const EditAccountForm({super.key, required this.formKey});

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  // Key to identify the form and perform validation
  //final _formKey = GlobalKey<FormState>();

  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  UserController userController = UserController();

  // Variables to hold the text for the form labels and descriptions
  final String _firstNameLabel = "Nombres";
  final String _fatherLastNameLabel = "Apellido Paterno";
  final String _motherLastNameLabel = "Apellido Materno";
  final String _cellphoneNumberLabel = "Número de Celular";

  // Initial State
  @override
  void initState() {
    super.initState();
    registrationUserFormData.nameController.text = userController.nombres!;
    registrationUserFormData.lastFatherNameController.text =
        userController.apellidoPaterno!;
    registrationUserFormData.lastMotherNameController.text =
        userController.getApellidoMaterno!;
    registrationUserFormData.cellPhoneNumberController.text =
        userController.numeroCelular!;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          // Name field
          CustomFormField(
              controller: registrationUserFormData.nameController,
              labelText: _firstNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          SizedBox(height: 16),
          // Father Last name
          CustomFormField(
              controller: registrationUserFormData.lastFatherNameController,
              labelText: _fatherLastNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          SizedBox(height: 16),
          // Mother Last name
          CustomFormField(
              controller: registrationUserFormData.lastMotherNameController,
              labelText: _motherLastNameLabel,
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          SizedBox(height: 16),
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
