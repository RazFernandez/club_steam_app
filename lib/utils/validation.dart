/* This file centralizes all validation functions to ensure user inputs across
 various fields are consistently and effectively validated. */

// Email validation fields
String? isValidEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, introduzca un correo institucional valido';
  }

  final RegExp regex = RegExp(r'^[\w-\.]+@itscarrillopuerto.edu.mx$');
  if (!regex.hasMatch(value)) {
    return 'Por favor, introduzca un correo con el dominio correcto';
  }

  return null;
}
