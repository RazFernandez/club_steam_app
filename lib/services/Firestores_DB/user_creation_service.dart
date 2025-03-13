import 'package:club_steam_app/models/user_clubsteam_model.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';
import 'package:club_steam_app/services/Firestores_DB/userQueries.dart';
import 'package:club_steam_app/exceptions/FormException.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class UserCreationService {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Instance of queries to the database class
  UserQueries userQueries = UserQueries();

  // Variable that handles the User object creation based on its type.
  String? selectedUserType;

  // QUitar
  // Constructor
  UserCreationService() {
    selectedUserType = registrationUserFormData.userType;
  }

  // Method to generate a user to register according to user type
  UserClubSteam generateUserToRegister() {
    switch (selectedUserType) {
      case 'Docente':
        return Docente(
            nombres: registrationUserFormData.name,
            apellidoPaterno: registrationUserFormData.lastFatherName,
            apellidoMaterno: registrationUserFormData.lastMotherName,
            correoElectronico: registrationUserFormData.email,
            numeroCelular: registrationUserFormData.cellPhoneNumber,
            tipoUsuario: registrationUserFormData.userType,
            // Later integrate google cloud to flutter
            fotoPerfil: "",
            proyectos: [],
            ingenieria: registrationUserFormData.unit);
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
            numeroControl: registrationUserFormData.controlNumber);
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
            unidadAdministrativa: registrationUserFormData.unit);
      default:
        throw FormExceptionHandler(
            code: 'invalid-user-type',
            message: 'El tipo de usuario $selectedUserType no existe');
    }
  }

  // Method to set the user type selected
  void setSelectedUserType(String? userType) {
    selectedUserType = userType;
  }

  // Method to test if user data is saved
  void testUserData() {
    final user = generateUserToRegister();
    if (user is Docente) {
      debugPrint(user.toDetailedString());
    } else if (user is Estudiante) {
      debugPrint(user.toDetailedString());
    } else if (user is Colaborador) {
      debugPrint(user.toDetailedString());
    } else {
      debugPrint(user.toString());
    }
  }

// This function creates a new user in firebase authentication
  Future<bool> createUserInFirebaseAuth(String email, String password) async {
    try {
      await AuthController().registerUser(email: email, password: password);
      return true;
    } catch (e) {
      // Returning false on any exception
      return false;
    }
  }

// This function creates a new user in the database
  Future<bool> addUserDataBase(UserClubSteam user, String uid) async {
    try {
      await userQueries.addUser(user, uid);
      return true;
    } catch (e) {
      // Returning false on any exception
      return false;
    }
  }
}
