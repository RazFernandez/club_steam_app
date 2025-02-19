class FirebaseAuthExceptionHandler {
  // Login-specific error message constants
  static const String loginInvalidEmailMessage = 'El correo no es válido.';
  static const String loginUserDisabledMessage =
      'El usuario ha sido deshabilitado.';
  static const String loginUserNotFoundMessage =
      'No existe ningún usuario correspondiente al correo proporcionado.';
  static const String loginWrongPasswordMessage = 'La contraseña es inválida.';
  static const String loginTooManyRequestsMessage =
      'Demasiadas solicitudes al mismo tiempo. Por favor, intente más tarde.';
  static const String loginUserTokenExpiredMessage =
      'Su token de actualización ha expirado.';
  static const String loginNetworkRequestFailedMessage =
      'Error de conexión a internet.';
  static const String loginInvalidLoginCredentialsMessage =
      'La contraseña es inválida, o la cuenta no tiene una contraseña establecida.';
  static const String loginOperationNotAllowedMessage =
      'Las cuentas de correo/contraseña no están habilitadas.';
  static const String loginUnknownErrorMessage =
      'Ocurrió un error inesperado en el inicio de sesión.';

  // Register-specific error message constants
  static const String registerEmailAlreadyInUseMessage =
      'Ya existe una cuenta con la dirección de correo proporcionada.';
  static const String registerInvalidEmailMessage =
      'El correo proporcionado no es válido.';
  static const String registerOperationNotAllowedMessage =
      'El registro con correo/contraseña no está habilitado.';
  static const String registerWeakPasswordMessage =
      'La contraseña es demasiado débil.';
  static const String registerTooManyRequestsMessage =
      'Demasiadas solicitudes al mismo tiempo. Por favor, intente más tarde.';
  static const String registerUserTokenExpiredMessage =
      'Su token de autenticación ha expirado.';
  static const String registerNetworkRequestFailedMessage =
      'Error de conexión a internet.';
  static const String registerUnknownErrorMessage =
      'Ocurrió un error inesperado en el registro.';

  // Variable to hold the current error message
  static String errorMessage = '';

  // Method to set error message for login
  static void setLoginErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        errorMessage = loginInvalidEmailMessage;
        break;
      case 'user-disabled':
        errorMessage = loginUserDisabledMessage;
        break;
      case 'user-not-found':
        errorMessage = loginUserNotFoundMessage;
        break;
      case 'wrong-password':
        errorMessage = loginWrongPasswordMessage;
        break;
      case 'too-many-requests':
        errorMessage = loginTooManyRequestsMessage;
        break;
      case 'user-token-expired':
        errorMessage = loginUserTokenExpiredMessage;
        break;
      case 'network-request-failed':
        errorMessage = loginNetworkRequestFailedMessage;
        break;
      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        errorMessage = loginInvalidLoginCredentialsMessage;
        break;
      case 'operation-not-allowed':
        errorMessage = loginOperationNotAllowedMessage;
        break;
      default:
        errorMessage = loginUnknownErrorMessage;
        break;
    }
  }

  // Method to set error message for register
  static void setRegisterErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        errorMessage = registerEmailAlreadyInUseMessage;
        break;
      case 'invalid-email':
        errorMessage = registerInvalidEmailMessage;
        break;
      case 'operation-not-allowed':
        errorMessage = registerOperationNotAllowedMessage;
        break;
      case 'weak-password':
        errorMessage = registerWeakPasswordMessage;
        break;
      case 'too-many-requests':
        errorMessage = registerTooManyRequestsMessage;
        break;
      case 'user-token-expired':
        errorMessage = registerUserTokenExpiredMessage;
        break;
      case 'network-request-failed':
        errorMessage = registerNetworkRequestFailedMessage;
        break;
      default:
        errorMessage = registerUnknownErrorMessage;
        break;
    }
  }

  // Method to retrieve the current error message
  static String getErrorMessage() {
    return errorMessage;
  }
}
