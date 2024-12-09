// Flutter package imports
import 'package:club_steam_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Model
import 'package:club_steam_app/models/user_model.dart';
import 'package:club_steam_app/models/user_form_data.dart';

// Views
import 'package:club_steam_app/views/login.dart';
import 'package:club_steam_app/views/home.dart';

// Controllers
import 'package:club_steam_app/controllers/auth_controller.dart';

// Services
import 'package:club_steam_app/services/Firestores_DB/userQueries.dart';

// Utilities
import 'package:club_steam_app/utils/icons.dart';
import 'package:club_steam_app/utils/strings_app.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/utils/dropdown_items.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:club_steam_app/utils/strings/FirebaseAuthError.dart';

// Widgets
import 'package:club_steam_app/widgets/dropdownFormField.dart';
import 'package:club_steam_app/widgets/passwordFormField.dart';
import 'package:club_steam_app/widgets/sizableButtom.dart';
import 'package:club_steam_app/widgets/customFormField.dart';

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
      String? email = userFormData.email;
      String? password = userFormData.passwordController.text.trim();
      String? usertype = userFormData.userTypeController.text.trim();

      try {
        // Register the user in Firebase Auth
        bool result = await AuthController()
            .registerUser(email: email, password: password);

        // Save data in Firestore

        // Pass the form data to the UserController
        userController.setUserFormData(userFormData);
        userController.setSelectedUserType(usertype);

        //await userController.addUserDataBase(userController.generateUserToRegister());
        await userController
            .addUserDataBase(userController.generateUserToRegister());

        // Clean data in memory of the fields
        //userFormData.clearFields();

        // Sends the user to the Loginview
        if (result && context.mounted) {
          //navigateAndClearStack(context, LoginView());
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase authentication error
        FirebaseAuthErrorHandler.setRegisterErrorMessage(e.code);
        String errorMessage = FirebaseAuthErrorHandler.getErrorMessage();

        // Show the error message as a toast using fluttertoast
        Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2, // Duration for iOS web
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  // Method to render textfields according to the user type
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
            validator: (value) =>
                isValidField(value, "Por favor, seleccione una opción"),
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
        validator: (value) =>
            isValidField(value, 'Por favor, seleccione una opción'),
      );
    }
    return SizedBox.shrink();
  }

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
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
          // Father Last name
          CustomFormField(
              controller: userFormData.lastFatherNameController,
              labelText: "Apellido Paterno",
              icon: AppIcons.personIcon,
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
          // Mother Last name
          CustomFormField(
              controller: userFormData.lastMotherNameController,
              labelText: "Apellido Materno",
              icon: AppIcons.personIcon,
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
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
            validator: (value) =>
                isValidField(value, FormFieldMessage.selectOption),
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
          SizableButtom(
            onPressed: () {
              _submitForm(context);
            },
            text: "Crear Cuenta",
            width: 250,
          ),
        ],
      ),
    );
  }
}
