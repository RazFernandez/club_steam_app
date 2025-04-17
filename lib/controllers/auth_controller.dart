import 'dart:developer';
import 'package:club_steam_app/services/firebase_functions/create_user_service.dart';

class AuthController {
  final _service = AuthFunctionsService();
  Future<bool> registerUser(String email, String password) async {
    try {
      final result = await _service.createUserWithFunction(
          email: email, password: password);
      log("User created: ${result['uid']}");
      return true;
    } catch (e) {
      log("User not created");
      return false;
    }
  }
}
