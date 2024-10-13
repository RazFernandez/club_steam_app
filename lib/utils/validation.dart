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

// Password validation fields
String? isValidPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, introduzca una contraseña válida';
  }
  if (value.length < 8) {
    return 'La contraseña debe tener al menos 8 caracteres';
  }
  final RegExp numberRegex = RegExp(r'\d');
  if (!numberRegex.hasMatch(value)) {
    return 'La contraseña debe contener al menos un número';
  }
  final RegExp specialCharRegex = RegExp(r'[!@#\$&*~_]');
  if (!specialCharRegex.hasMatch(value)) {
    return 'La contraseña debe contener al menos un carácter especial';
  }
  return null;
}

// Validates that two password fields contains the same values
String? validatePasswords(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Las contraseñas no coinciden';
  }
  return null;
}
