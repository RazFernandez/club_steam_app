import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/customFormField.dart';
import 'package:club_steam_app/utils/validation.dart';

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

  // Function to validate and submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If all fields are valid, process the registration
      debugPrint('Form is valid, proceed with registration');
    } else {
      debugPrint('Form is invalid');
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
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Correo Electrónico',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: isValidEmail),
                      CustomFormField(
                          labelText: "Correo",
                          icon: emailIcon,
                          validator: isValidEmail),
                      // Password field
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, introduzca un correo institucional valido';
                            }
                            return null;
                          }),
                      // The password
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