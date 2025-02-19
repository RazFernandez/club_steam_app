/// A custom exception handler for file-related errors.

class FileOperationException implements Exception {
  final String? message;
  final String code;

  // Error codes as constants
  static const String fileNotFound = "file-not-found";
  static const String fileNotSaved = "file-not-saved";
  static const String imageNotFound = "image-not-found";
  static const String imageNotSaved = "image-not-saved";
  static const String photoNotFound = "photo-not-found";
  static const String photoNotSaved = "photo-not-saved";

  FileOperationException({required this.code, this.message});

  @override
  String toString() {
    switch (code) {
      case fileNotFound:
        return "Error, el archivo no fue encontrado";
      case fileNotSaved:
        return "Error, el archivo no fue guardado";
      case imageNotFound:
        return "Error, la imagen no fue encontrada";
      case imageNotSaved:
        return "Error, la imagen no fue guardada";
      case photoNotFound:
        return "Error, la foto no fue encontrada";
      case photoNotSaved:
        return "Error, la foto no fue guardada";
      default:
        return "Ha ocurrido un error inesperado";
    }
  }
}
