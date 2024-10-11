import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  // Track whether the password is visible or not
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(
          Icons.lock,
        ),
        suffixIcon: IconButton(
          // Toggle the password visibility
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          // Change the Icon
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
