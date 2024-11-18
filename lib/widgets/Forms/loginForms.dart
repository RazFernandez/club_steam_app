import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/icons.dart';
import 'package:club_steam_app/utils/strings.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/passwordFormField.dart';
import 'package:club_steam_app/widgets/sizableButtom.dart';
import 'package:club_steam_app/widgets/customFormField.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';
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
    if (_formKey.currentState!.validate()) {
      String? email = _emailController.text;
      String? password = _passwordController.text;
      // Firabase Message
      String message =
          await AuthController().loginUserWithPassword(email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      if (message == LoginMessages.successfulLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
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
          SizableButtom(
            onPressed: () {
              _submitForm(context);
            },
            text: "Iniciar Sesión",
            width: 250,
          ),
        ],
      ),
    );
  }
}
