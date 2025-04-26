import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:club_steam_app/models/user_clubsteam_model.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';

class UsersCRUDService {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Variable that handles the User object creation based on its type.
  String? selectedUserType;

  // Set user type to create the JSON object
  void setSelectedUserType(String? userType) {
    selectedUserType = userType;
  }

  // Method to generate a user to register according to user type
  UserClubSteam? generateUserToRegister() {
    switch (selectedUserType) {
      case 'Docente':
        return Docente(
          nombres: registrationUserFormData.name,
          apellidoPaterno: registrationUserFormData.lastFatherName,
          apellidoMaterno: registrationUserFormData.lastMotherName,
          correoElectronico: registrationUserFormData.email,
          numeroCelular: registrationUserFormData.cellPhoneNumber,
          tipoUsuario: registrationUserFormData.userType,
          fotoPerfil: "",
          proyectos: [],
          ingenieria: registrationUserFormData.unit,
        );
      case 'Estudiante':
        return Estudiante(
          nombres: registrationUserFormData.name,
          apellidoPaterno: registrationUserFormData.lastFatherName,
          apellidoMaterno: registrationUserFormData.lastMotherName,
          correoElectronico: registrationUserFormData.email,
          numeroCelular: registrationUserFormData.cellPhoneNumber,
          tipoUsuario: registrationUserFormData.userType,
          fotoPerfil: "",
          proyectos: [],
          ingenieria: registrationUserFormData.unit,
          numeroControl: registrationUserFormData.controlNumber,
        );
      case 'Colaborador':
        return Colaborador(
          nombres: registrationUserFormData.name,
          apellidoPaterno: registrationUserFormData.lastFatherName,
          apellidoMaterno: registrationUserFormData.lastMotherName,
          correoElectronico: registrationUserFormData.email,
          numeroCelular: registrationUserFormData.cellPhoneNumber,
          tipoUsuario: registrationUserFormData.userType,
          fotoPerfil: "",
          proyectos: [],
          unidadAdministrativa: registrationUserFormData.unit,
        );
      default:
        return null;
    }
  }

  // Send user JSON to Cloud Funtion
  Future<void> sendUserData(UserClubSteam user, String uid) async {
    // Database URL API to create users
    final url = Uri.parse('https://createuser-j7fvzwscaa-uc.a.run.app');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "uid": uid,
          ...user.toJson(),
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

  // Method to retrieve information of the user
  Future<Map<String, dynamic>?> fetchUser(String uid) async {
    final url = Uri.parse(
        'https://getuserinfo-j7fvzwscaa-uc.a.run.app?uid=$uid'); // Sample API

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a successful response, parse the JSON
        final data = jsonDecode(response.body);
        log("User info fetched: $data");
        return data;
      } else {
        log('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      log("Excepción: $e");
      return null;
    }
  }
}
