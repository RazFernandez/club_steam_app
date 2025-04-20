import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:club_steam_app/models/user_clubsteam_model.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';
import 'package:club_steam_app/services/Firestores_DB/userQueries.dart';
import 'package:club_steam_app/exceptions/FormException.dart';
import 'package:flutter/material.dart';

class UserCreationdbService {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Variable that handles the User object creation based on its type.
  String? selectedUserType;

  // // Retrieves the value of the registration controller
  // userCreationService() {
  //   selectedUserType = registrationUserFormData.userType;
  // }

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
    final url = Uri.parse(
        'http://10.0.2.2:5001/club-steam-abd01/us-central1/createUser');
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
}
