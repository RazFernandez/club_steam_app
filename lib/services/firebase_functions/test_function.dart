import 'dart:developer';
import 'package:cloud_functions/cloud_functions.dart';

class TestFunction {
  final FirebaseFunctions functions =
      FirebaseFunctions.instanceFor(region: 'us-central1');

  Future<void> callCreateUserFunction() async {
    try {
      final result = await functions.httpsCallable('createUserDB').call({
        'email': 'testuser@example.com',
        'password': 'testPassword123',
      });

      log('User created locally: ${result.data}');
    } catch (e) {
      log('Error calling function: $e');
    }
  }
}
