import 'package:club_steam_app/services/Firestores_DB/userQueries.dart';
import 'package:club_steam_app/models/user_model.dart';
import 'package:club_steam_app/models/user_form_data.dart';
import 'package:club_steam_app/exceptions/FormException.dart';

class UserController {
  // Variable that handles the User object creation based on its type.
  String? selectedUserType;

  // Instance of queries to the database class
  UserQueries userQueries = UserQueries();

  // Instance of the class that handles form data
  late UserFormData userFormData;

  // Method to set the form data
  void setUserFormData(UserFormData formData) {
    userFormData = formData;
  }

  // Method to set selectedUserType
  void setSelectedUserType(String? userType) {
    selectedUserType = userType;
  }

  // Setter method to assign a new user
  UserClubSteam generateUserToRegister() {
    // Select the type of user to create
    switch (selectedUserType) {
      case 'Docente':
        return Docente(
            nombres: userFormData.name,
            apellidoPaterno: userFormData.lastFatherName,
            apellidoMaterno: userFormData.lastMotherName,
            correoElectronico: userFormData.email,
            numeroCelular: userFormData.cellPhoneNumber,
            tipoUsuario: userFormData.userType,
            // Later integrate google cloud to flutter
            fotoPerfil: "",
            proyectos: [],
            ingenieria: userFormData.unit);
      case 'Estudiante':
        return Estudiante(
            nombres: userFormData.name,
            apellidoPaterno: userFormData.lastFatherName,
            apellidoMaterno: userFormData.lastMotherName,
            correoElectronico: userFormData.email,
            numeroCelular: userFormData.cellPhoneNumber,
            tipoUsuario: userFormData.userType,
            fotoPerfil: "",
            proyectos: [],
            ingenieria: userFormData.unit,
            numeroControl: userFormData.controlNumber);
      case 'Colaborador':
        return Colaborador(
            nombres: userFormData.name,
            apellidoPaterno: userFormData.lastFatherName,
            apellidoMaterno: userFormData.lastMotherName,
            correoElectronico: userFormData.email,
            numeroCelular: userFormData.cellPhoneNumber,
            tipoUsuario: userFormData.userType,
            fotoPerfil: "",
            proyectos: [],
            unidadAdministrativa: userFormData.unit);
      default:
        throw FormExceptionHandler(
            code: 'invalid-user-type',
            message: 'El tipo de usuario $selectedUserType no existe');
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
