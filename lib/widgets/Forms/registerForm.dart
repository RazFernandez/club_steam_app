// Flutter package imports
import 'package:club_steam_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

// Model
import 'package:club_steam_app/models/user_model.dart';
import 'package:club_steam_app/models/user_form_data.dart';

// Views
import 'package:club_steam_app/views/login_workflow/login.dart';

// Controllers
import 'package:club_steam_app/controllers/auth_controller.dart';

// Services

// Exception
import 'package:club_steam_app/exceptions/FormException.dart';

// Utilities
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/utils/dropdown_items.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthException.dart';

// Widgets
import 'package:club_steam_app/widgets/TextFields/dropdownFormField.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Object to handle controller values of the text fields
  UserFormData userFormData = UserFormData();

  // Instance of the user controller
  UserController userController = UserController();

  // Variables to hold selected dropdown values
  String? _selectedUserType;
  String? _selectedUnit;

  // Method to check if the form is valid.
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the data from the user data form
      String? email = userFormData.email;
      String? password = userFormData.passwordController.text.trim();
      String? usertype = userFormData.userTypeController.text.trim();

      // Pass the form data to the UserController
      userController.setUserFormData(userFormData);

      // Select the user type of object to be created
      userController.setSelectedUserType(usertype);

      // Create an user object based on its type of user selected
      UserClubSteam userMapObject = userController.generateUserToRegister();

      // Variable to save user UID
      String? userUID;

      // First Try to create the user account
      try {
        // Save the variables to verify results
        bool? resultAuth;
        bool? resultDataBase;

        // First create the user in firabase
        resultAuth = await AuthController()
            .registerUser(email: email, password: password);

        if (!resultAuth) {
          throw FirebaseAuthException(code: 'email-already-in-use');
        }

        // Save UID in a local variable
        userUID = AuthController().currentUserUID;
        if (userUID == null) {
          throw Exception('Error al intentar obtener el UID del usuario');
        }

        // Save data in Firestore first
        resultDataBase =
            await userController.addUserDataBase(userMapObject, userUID);

        if (!resultDataBase) {
          throw FormExceptionHandler(code: 'data-not-saved');
        }

        // Sends the user to the Loginview
        if (resultAuth && resultDataBase && context.mounted) {
          navigateAndClearStack(context, LoginView());
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase authentication error
        // Translates the exception message
        FirebaseAuthExceptionHandler.setRegisterErrorMessage(e.code);
        String errorMessage = FirebaseAuthExceptionHandler.getErrorMessage();

        if (context.mounted) {
          ToastManager.error(context, errorMessage).show();
        }
      } catch (e) {
        // Mananges any type of Exception
        if (context.mounted) {
          ToastManager.error(context, e.toString()).show();
        }

        // Delete the user account in case something go wrong in another process
        // For example if user data is not saved in Firestore
        // or google cloud don't save the user profile image
        await AuthController()
            .signInUsingEmail(email: email, password: password);
        await AuthController().deleteUser();

        debugPrint('Account Deleteded Due to data not saved');
      }
    }
  }

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
            controller: userFormData.unitController,
            validator: (value) => isValidMultiOptionField(value),
          ),
          // Just the Estudiantes request their control number
          if (userType == 'Estudiante')
            CustomFormField(
              labelText: 'Número de Control',
              icon: AppIcons.controlNumIcon,
              controller: userFormData.controlNumberController,
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
        controller: userFormData.unitController,
        validator: (value) => isValidMultiOptionField(value),
      );
    }
    return SizedBox.shrink();
  }

  /*
  =========================
  USER INTERFACE
  =========================
  */

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name field
          CustomFormField(
              controller: userFormData.nameController,
              labelText: "Nombres",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          // Father Last name
          CustomFormField(
              controller: userFormData.lastFatherNameController,
              labelText: "Apellido Paterno",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          // Mother Last name
          CustomFormField(
              controller: userFormData.lastMotherNameController,
              labelText: "Apellido Materno",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          // Email field
          CustomFormField(
              controller: userFormData.emailController,
              labelText: "Correo",
              icon: AppIcons.emailIcon,
              validator: (value) => isValidEmail(value)),

          // Cell phone number field
          CustomFormField(
              controller: userFormData.cellPhoneNumberController,
              labelText: "Número de Celular",
              icon: AppIcons.phoneIcon,
              validator: (value) => isValidPhoneNumber(value)),

          // Type of user field
          DropdownFormField<String>(
            labelText: 'Tipo de usuario',
            icon: AppIcons.typeUserIcon,
            items: userTypes,
            value: _selectedUserType,
            controller: userFormData.userTypeController,
            validator: (value) => isValidMultiOptionField(value),
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ),
          // Rendering content fields based on user type
          _renderContentFields(_selectedUserType),
          // Password field
          PasswordFormField(
              controller: userFormData.passwordController,
              labelText: "Contraseña",
              validator: (value) => isValidPassword(value)),
          PasswordFormField(
              controller: userFormData.confirmPasswordController,
              labelText: "Confirmar Contraseña",
              validator: (value) => validatePasswords(
                  userFormData.passwordController.text,
                  userFormData.confirmPasswordController.text)),
          SizedBox(height: 24),
          SizableButton(
              onPressed: () {
                _submitForm(context);
              },
              text: "Crear Cuenta",
              width: 250,
              typeOfButton: ButtonType.outlinedButton),
        ],
      ),
    );
  }
}
