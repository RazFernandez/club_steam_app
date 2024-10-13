import 'package:club_steam_app/views/register.dart';
import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/customFormField.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/passwordFormField.dart';
import 'package:club_steam_app/widgets/sizableButtom.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:club_steam_app/views/home.dart';
import 'package:club_steam_app/controllers/user_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Icons for fields and buttons
  IconData emailIcon = Icons.email_outlined;

  // Function to validate and submit the login form
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String? email = _emailController.text;
      String? password = _passwordController.text;
      bool success = await UserController().loginUser(email, password);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inicio de sesión exitoso')),
        );
        debugPrint('User logged in successfully');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en el inicio de sesión')),
        );
        debugPrint('Login failed');
      }
    } else {
      debugPrint('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo Image
              Image.asset('lib/assets/icon/Club_Steam_Logo.png', height: 200),
              SizedBox(height: 24),
              // Email TextField
              CustomFormField(
                  controller: _emailController,
                  labelText: "Correo",
                  icon: emailIcon,
                  validator: (value) => isValidEmail(value)),
              SizedBox(height: 16),
              // Password TextField
              PasswordFormField(
                controller: _passwordController,
                labelText: "Contraseña",
                validator: (value) => isValidPassword(value),
              ),
              SizedBox(height: 16),
              // Login Button
              SizableButtom(
                  onPressed: () {
                    _submitForm(context);
                  },
                  text: "Iniciar Sesión",
                  width: 250),
              SizedBox(height: 16),
              // Recover password
              TextButton(onPressed: () {}, child: Text('Recuperar Contraseña')),
              SizedBox(height: 16),
              // Divider
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text('o'),
                  Expanded(child: Divider())
                ],
              ),
              SizedBox(height: 16),
              Text("Inicie Sesión con"),
              // Google Sing-In Button
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'lib/assets/icon/google_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),

              // Register Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿No tienes una cuenta?"),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, RegisterView());
                    },
                    child: Text(
                      'Registrate',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
