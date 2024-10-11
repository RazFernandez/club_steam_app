import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // The ID of this form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        child: Column(
      children: <Widget>[
        // Here are the fields for this form
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Nombres',
            prefixIcon: Icon(Icons.person_2_outlined),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, ingresa tu nombre';
            }
            return null;
          },
        ),
      ],
    ));
  }
}
