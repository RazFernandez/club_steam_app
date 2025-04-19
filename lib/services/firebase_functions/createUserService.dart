import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CloudFunctionsCreateUserFirestore {
  static Future<void> sendUserData(String email, String password) async {
    // Database URL API to create users
    final url = Uri.parse(
        'http://10.0.2.2:5001/club-steam-abd01/us-central1/createUser');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        log("User added: ${response.body}");
      } else {
        log('Error: ${response.body}');
      }
    } catch (e) {
      log("Excepción: $e");
    }
  }
}
