class FirebaseAuthErrorHandler {
  // Define error message constants
  static const String invalidEmailMessage = 'El correo no es válido.';
  static const String userDisabledMessage = 'El usuario ha sido deshabilitado.';
  static const String userNotFoundMessage =
      'No existe ningún usuario correspondiente al correo proporcionado.';
  static const String wrongPasswordMessage = 'La contraseña es inválida.';
  static const String tooManyRequestsMessage =
      'Demasiadas solicitudes al mismo tiempo. Por favor, intente más tarde.';
  static const String userTokenExpiredMessage =
      'Su token de actualización ha expirado.';
  static const String networkRequestFailedMessage =
      'Error de conexión a internet.';
  static const String invalidLoginCredentialsMessage =
      'La contraseña es inválida, o la cuenta no tiene una contraseña establecida.';
  static const String operationNotAllowedMessage =
      'Las cuentas de correo/contraseña no están habilitadas.';
  static const String unknownErrorMessage = 'Ocurrió un error inesperado.';

  // Variable to hold the current error message
  static String errorMessage = unknownErrorMessage;

  // This method sets the correct string message to be used
  static void setErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        errorMessage = invalidEmailMessage;
        break;
      case 'user-disabled':
        errorMessage = userDisabledMessage;
        break;
      case 'user-not-found':
        errorMessage = userNotFoundMessage;
        break;
      case 'wrong-password':
        errorMessage = wrongPasswordMessage;
        break;
      case 'too-many-requests':
        errorMessage = tooManyRequestsMessage;
        break;
      case 'user-token-expired':
        errorMessage = userTokenExpiredMessage;
        break;
      case 'network-request-failed':
        errorMessage = networkRequestFailedMessage;
        break;
      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        errorMessage = invalidLoginCredentialsMessage;
        break;
      case 'operation-not-allowed':
        errorMessage = operationNotAllowedMessage;
        break;
      default:
        errorMessage = unknownErrorMessage;
        break;
    }
  }

  // Method to get the current error message
  static String getErrorMessage() {
    return errorMessage;
  }
}
