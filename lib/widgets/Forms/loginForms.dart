import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthException.dart';
import 'package:club_steam_app/widgets/TextFields/passwordFormField.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/views/home.dart';

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

  // Method to check if the form is valid.
  void _submitForm(BuildContext context) async {
    String? email = _emailController.text.trim();
    String? password = _passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      // Login the user
      try {
        bool result = await AuthController()
            .signInUsingEmail(email: email, password: password);

        // Sends the user to the homeview
        if (result && context.mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase authentication error
        FirebaseAuthExceptionHandler.setLoginErrorMessage(e.code);
        String errorMessage = FirebaseAuthExceptionHandler.getErrorMessage();

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
