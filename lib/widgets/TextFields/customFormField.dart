import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller; // Optional controller if needed
  final TextInputType? keyboardType;

  // Primary constructor
  const CustomFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.validator,
    this.controller,
  }) : keyboardType = null;

  // Named constructor for phone number field
  const CustomFormField.phoneNumber({
    super.key,
    required this.labelText,
    required this.icon,
    this.validator,
    this.controller,
  }) : keyboardType = TextInputType.phone;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
