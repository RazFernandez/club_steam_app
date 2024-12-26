/// A custom exception handler for form-related errors.
class FormExceptionHandler implements Exception {
  final String? message;
  final String code;

  // Error codes as constants
  static const String invalidUserType = "invalid-user-type";
  static const String dataNotSaved = "data-not-saved";

  FormExceptionHandler({required this.code, this.message});

  @override
  String toString() {
    switch (code) {
      case invalidUserType:
        return "Error, el usuario ingresado es invalido";
      case dataNotSaved:
        return "Error, los datos no fueron almacenados en la base de datos";
      default:
        return "Ha ocurrido un error inesperado";
    }
  }
}
