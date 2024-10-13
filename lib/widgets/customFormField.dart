import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller; // Optional controller if needed

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
      validator: validator,
    );
  }
}
