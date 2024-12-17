class FirestorErrorHandler {
  // Error message constants
  static const String abortedMessage =
      'La operación fue abortada debido a un problema de concurrencia.';
  static const String alreadyExistsMessage =
      'El documento que intenta crear ya existe.';
  static const String cancelledMessage =
      'La operación fue cancelada por el usuario.';
  static const String dataLossMessage =
      'Pérdida o corrupción de datos irrecuperables.';
  static const String deadlineExceededMessage =
      'El tiempo límite de la operación ha expirado.';
  static const String failedPreconditionMessage =
      'El sistema no está en el estado requerido para ejecutar la operación.';
  static const String internalMessage = 'Error interno.';
  static const String invalidArgumentMessage =
      'Se proporcionó un argumento no válido.';
  static const String notFoundMessage =
      'El documento solicitado no fue encontrado.';
  static const String okMessage = 'La operación se completó exitosamente.';
  static const String outOfRangeMessage =
      'La operación se intentó fuera del rango válido.';
  static const String permissionDeniedMessage =
      'No tiene permisos para ejecutar la operación especificada.';
  static const String resourceExhaustedMessage =
      'Se agotó un recurso, como el límite de cuota o espacio en disco.';
  static const String unauthenticatedMessage =
      'No tiene credenciales de autenticación válidas.';
  static const String unavailableMessage =
      'El servicio no está disponible actualmente.';
  static const String unimplementedMessage =
      'La operación no está implementada o no es compatible.';
  static const String unknownMessage = 'Error desconocido o de otro dominio.';

  // Variable to hold the current error message
  static String errorMessage = '';

  // Method to set error message
  static void setErrorMessage(String code) {
    switch (code) {
      case 'ABORTED':
        errorMessage = abortedMessage;
        break;
      case 'ALREADY_EXISTS':
        errorMessage = alreadyExistsMessage;
        break;
      case 'CANCELLED':
        errorMessage = cancelledMessage;
        break;
      case 'DATA_LOSS':
        errorMessage = dataLossMessage;
        break;
      case 'DEADLINE_EXCEEDED':
        errorMessage = deadlineExceededMessage;
        break;
      case 'FAILED_PRECONDITION':
        errorMessage = failedPreconditionMessage;
        break;
      case 'INTERNAL':
        errorMessage = internalMessage;
        break;
      case 'INVALID_ARGUMENT':
        errorMessage = invalidArgumentMessage;
        break;
      case 'NOT_FOUND':
        errorMessage = notFoundMessage;
        break;
      case 'OK':
        errorMessage = okMessage;
        break;
      case 'OUT_OF_RANGE':
        errorMessage = outOfRangeMessage;
        break;
      case 'PERMISSION_DENIED':
        errorMessage = permissionDeniedMessage;
        break;
      case 'RESOURCE_EXHAUSTED':
        errorMessage = resourceExhaustedMessage;
        break;
      case 'UNAUTHENTICATED':
        errorMessage = unauthenticatedMessage;
        break;
      case 'UNAVAILABLE':
        errorMessage = unavailableMessage;
        break;
      case 'UNIMPLEMENTED':
        errorMessage = unimplementedMessage;
        break;
      default:
        errorMessage = unknownMessage;
        break;
    }
  }

  // Method to retrieve the current error message
  static String getErrorMessage() {
    return errorMessage;
  }
}
