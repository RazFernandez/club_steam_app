class FormExceptionHandler implements Exception {
  final String? message;
  final String code;

  FormExceptionHandler({required this.code, this.message});

  @override
  String toString() {
    switch (code) {
      case "invalid-user-type":
        return "Error, el usuario ingresado es invalido";
      case "data-not-saved":
        return "Error, los datos no fueron almacenados en la base de datos";
      default:
        return "Ha ocurrido un error inesperado";
    }
  }
}
