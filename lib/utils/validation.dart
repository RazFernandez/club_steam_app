/* This file centralizes all validation functions to ensure user inputs across
 various fields are consistently and effectively validated. */

// General validation fields
String? isValidField(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  }
  return null;
}

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

// Phone number validation function
String? isValidPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, introduzca un número de celular válido';
  }
  final RegExp regex = RegExp(r'^\d{10}$');
  if (!regex.hasMatch(value)) {
    return 'Debe contener exactamente 10 dígitos';
  }
  return null;
}
