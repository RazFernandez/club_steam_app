import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/views/login_workflow/registration_email/verificationEmail_view.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthException.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/views/home.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // The ID of this form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Variables to store values
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instance of the authentication service
  AuthService authService = AuthService();

  // Method to validate account before access to main view
  Future<bool> _validateEmail() async {
    await authService.reloadUserData();
    bool emailValidated = await authService.checkEmailVerification();
    return emailValidated;
  }

  // Method to login the user
  // This method will be called when the user submits the form

  Future<bool> _loginUser() async {
    String? email = _emailController.text.trim();
    String? password = _passwordController.text.trim();

    bool isLoginSuccessful = false;

    try {
      // First try to login the user
      User? user =
          await authService.loginUserWithEmailAndPassword(email, password);

      // Check if the login was successful
      if (user != null) {
        isLoginSuccessful = true;
      } else {
        isLoginSuccessful = false;
      }
    } catch (e) {
      isLoginSuccessful = false;
      log("Error in login process: ${e.toString()}");
    }

    return isLoginSuccessful;
  }

  // Method to check if the email is valid
  Future<bool> _isEmailValid() async {
    bool isEmailValid = await authService.checkEmailVerification();
    if (isEmailValid) {
      return true;
    } else {
      return false;
    }
  }

  // Method to check if the form is valid.
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      bool isLoginSuccessful = await _loginUser();
      bool isEmailValid = await _isEmailValid();

      // Check if the login was successful and the email is validated
      if (isLoginSuccessful && isEmailValid && context.mounted) {
        navigateAndClearStack(context, HomeView());
        log("Account verified");
      }
      // Check if the login was successful but the email is not validated
      else if (isLoginSuccessful && !isEmailValid && context.mounted) {
        navigateTo(context, VerificationemailView(indexView: 2));
        log("Account not verified");
      }
      // Check if the login was not successful
      else if (!isLoginSuccessful && context.mounted) {
        String errorMessage = FirebaseAuthExceptionHandler.getErrorMessage();
        ToastManager.error(context, errorMessage).show();
        log("Login failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormField(
            controller: _emailController,
            labelText: "Correo",
            icon: AppIcons.emailIcon,
            validator: (value) => isValidEmail(value),
          ),
          SizedBox(height: 16),
          PasswordFormField(
            controller: _passwordController,
            labelText: "Contraseña",
            validator: (value) => isValidPassword(value),
          ),
          SizedBox(height: 24),
          SizableButton(
            onPressed: () {
              _submitForm(context);
            },
            text: "Iniciar Sesión",
            width: 250,
            typeOfButton: ButtonType.filledButton,
          ),
        ],
      ),
    );
  }
}
