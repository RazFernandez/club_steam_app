import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/customFormField.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/widgets/passwordFormField.dart';
import 'package:club_steam_app/controllers/user_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Here go the Icons used for the Text Form Fields
  IconData emailIcon = Icons.email_outlined;

  // Controllers to retrieve the values of text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Variable to hold selected role
  String? _selectedRole;

  final PageController _pageController = PageController();
  int _currentPage = 0; // Track current page for progress bar

  // This function updates the current page index and rebuilds the progress bar
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  // Function to validate and submit the registration form
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String? email = _emailController.text;
      String? password = _passwordController.text;
      bool success = await UserController().registerUser(email, password);

      // Whether the creation of the user account was succeful or not, it displays
      // a snackbar
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Su cuenta ha sido creada con éxito')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ha ocurrido un error')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No ha rellenado todos los campos de registro")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Linear progress bar to show step progress
          LinearProgressIndicator(value: (_currentPage + 1) / 2),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Form key for validation
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Email field
                      CustomFormField(
                          controller: _emailController,
                          labelText: "Correo",
                          icon: emailIcon,
                          validator: (value) => isValidEmail(value)),
                      // Password field
                      PasswordFormField(
                          controller: _passwordController,
                          labelText: "Contraseña",
                          validator: (value) => isValidPassword(value)),
                      PasswordFormField(
                          controller: _confirmPasswordController,
                          labelText: "Confirmar Contraseña",
                          validator: (value) => validatePasswords(
                              _passwordController.text,
                              _confirmPasswordController.text)),

                      /*
                      // First Name
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombres',
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        // Add a validator for the form
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu nombre';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Last Name (Paternal)
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Apellido Paterno',
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu apellido paterno';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Last Name (Maternal)
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Apellido Materno',
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu apellido materno';
                          }
                          return null;
                        },
                      ),*/
                      SizedBox(height: 24),

                      // Register button to submit the form
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _submitForm, // Submit form
                          child: Text('Registrarse'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
