import 'dart:developer';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFunctionsService {
  final HttpsCallable _createUserCallable =
      FirebaseFunctions.instance.httpsCallable("createUserDB");

  Future<Map<String, dynamic>> createUserWithFunction({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _createUserCallable.call({
        'email': email,
        'password': password,
      });

      final data = Map<String, dynamic>.from(result.data);
      return data;
    } on FirebaseFunctionsException catch (e) {
      // You could handle specific Firebase errors here
      throw Exception("Function error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
