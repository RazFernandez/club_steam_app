class InvalidUserTypeException implements Exception {
  final String message;
  InvalidUserTypeException(this.message);

  @override
  String toString() => "InvalidUserTypeException: $message";
}
