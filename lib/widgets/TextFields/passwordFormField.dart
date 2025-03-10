import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;

  const PasswordFormField({
    super.key,
    this.controller,
    this.validator,
    this.labelText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  // Track wheter the password is visible or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: Icon(AppIcons.lockPasswordIcon),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              icon: Icon(_isObscure
                  ? AppIcons.viewPasswordIcon
                  : AppIcons.hidePasswordIcon))),
      validator: widget.validator,
    );
  }
}
