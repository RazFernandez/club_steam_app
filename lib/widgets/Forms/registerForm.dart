// Flutter package imports
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Views
import 'package:club_steam_app/views/login.dart';
import 'package:club_steam_app/views/home.dart';

// Controllers
import 'package:club_steam_app/controllers/auth_controller.dart';

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

  // Controllers to retrieve the values of text fields]
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastFatherNameController =
      TextEditingController();
  final TextEditingController _lastMotherNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellPhoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _controlNumberController =
      TextEditingController();

  // Variables to hold selected dropdown values
  String? _selectedUserType;
  String? _selectedUnit;

  // Method to check if the form is valid.
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String? email = _emailController.text.trim();
      String? password = _passwordController.text.trim();

      try {
        // Register the user
        bool result = await AuthController()
            .registerUser(email: email, password: password);

        // Sends the user to the Loginview
        if (result && context.mounted) {
          navigateAndClearStack(context, LoginView());
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
            controller: _unitController,
            validator: (value) =>
                isValidField(value, "Por favor, seleccione una opción"),
          ),
          // Just the Estudiantes request their control number
          if (userType == 'Estudiante')
            CustomFormField(
              labelText: 'Número de Control',
              icon: AppIcons.controlNumIcon,
              controller: _controlNumberController,
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
        controller: _unitController,
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
              controller: _nameController,
              labelText: "Nombres",
              icon: AppIcons.personIcon,
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
          // Father Last name
          CustomFormField(
              controller: _lastFatherNameController,
              labelText: "Apellido Paterno",
              icon: AppIcons.personIcon,
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
          // Mother Last name
          CustomFormField(
              controller: _lastMotherNameController,
              labelText: "Apellido Materno",
              icon: AppIcons.personIcon,
              validator: (value) =>
                  isValidField(value, FormFieldMessage.noNullFields)),
          // Email field
          CustomFormField(
              controller: _emailController,
              labelText: "Correo",
              icon: AppIcons.emailIcon,
              validator: (value) => isValidEmail(value)),

          // Cell phone number field
          CustomFormField(
              controller: _cellPhoneNumberController,
              labelText: "Número de Celular",
              icon: AppIcons.phoneIcon,
              validator: (value) => isValidPhoneNumber(value)),

          // Type of user field
          DropdownFormField<String>(
            labelText: 'Tipo de usuario',
            icon: AppIcons.typeUserIcon,
            items: userTypes,
            value: _selectedUserType,
            controller: _userTypeController,
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
              controller: _passwordController,
              labelText: "Contraseña",
              validator: (value) => isValidPassword(value)),
          PasswordFormField(
              controller: _confirmPasswordController,
              labelText: "Confirmar Contraseña",
              validator: (value) => validatePasswords(
                  _passwordController.text, _confirmPasswordController.text)),
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
