import 'dart:developer';
import 'package:club_steam_app/services/Firestores_DB/users_CRUD_DB_service.dart';

class UserController {
  // Singleton setup
  static final UserController _instance = UserController._internal();
  factory UserController() => _instance;
  UserController._internal();

  // User data fields
  String? nombres;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? correoElectronico;
  String? numeroControl;
  String? numeroCelular;
  String? tipoUsuario;
  String? fotoPerfil;
  List<String> proyectos = [];
  String? ingenieria;
  String? unidadAdministrativa;

  // Call this to load and store user info
  Future<void> loadUser(String uid) async {
    try {
      final data = await UsersCRUDService().fetchUser(uid);
      if (data != null) {
        nombres = data['nombres'];
        apellidoPaterno = data['apellidoPaterno'];
        apellidoMaterno = data['apellidoMaterno'];
        correoElectronico = data['correoElectronico'];
        numeroControl = data['numeroControl'];
        numeroCelular = data['numeroCelular'];
        tipoUsuario = data['tipoUsuario'];
        fotoPerfil = data['fotoPerfil'];
        proyectos = List<String>.from(data['proyectos'] ?? []);
        ingenieria = data['ingenieria'];
        unidadAdministrativa = data['unidadAdministrativa'];

        log('User data loaded successfully');
      }
    } catch (e) {
      log("Failed to load user: $e");
    }
  }

  // Full name getter
  String get fullName => "$nombres $apellidoPaterno $apellidoMaterno";
}
