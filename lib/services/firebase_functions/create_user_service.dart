import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CloudFunctionsCreateUserDB {
  static Future<void> addUser() async {
    // Database URL API to add users
    final url = 'http://10.0.2.2:5001/club-steam-abd01/us-central1/addUser';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log('User created sucessfully');
      } else {
        log('Error: ${response.body}');
      }
    } catch (e) {
      log("Excepción: $e");
    }
  }
}
