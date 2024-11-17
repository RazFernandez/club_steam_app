class UserModel {
  final String uid;
  final String email;
  final String apellidoMaterno;
  final String apellidoPaterno;
  final String fotoPerfil;
  final String nombres;
  final String numeroCelular;
  final List<String> proyectos; // List of projects
  final String tipoUsuario;

  UserModel({
    required this.uid,
    required this.email,
    required this.apellidoMaterno,
    required this.apellidoPaterno,
    required this.fotoPerfil,
    required this.nombres,
    required this.numeroCelular,
    required this.proyectos,
    required this.tipoUsuario,
  });
}

// Docente model with an additional 'ingenieria' field
class Docente extends UserModel {
  final String ingenieria;

  Docente({
    required String uid,
    required String email,
    required String apellidoMaterno,
    required String apellidoPaterno,
    required String fotoPerfil,
    required String nombres,
    required String numeroCelular,
    required List<String> proyectos,
    required this.ingenieria,
  }) : super(
          uid: uid,
          email: email,
          apellidoMaterno: apellidoMaterno,
          apellidoPaterno: apellidoPaterno,
          fotoPerfil: fotoPerfil,
          nombres: nombres,
          numeroCelular: numeroCelular,
          proyectos: proyectos,
          tipoUsuario: "Docente",
        );
}

// Estudiante model with an additional 'ingenieria' and 'numeroControl' fields
class Estudiante extends UserModel {
  final String ingenieria;
  final String numeroControl;

  Estudiante({
    required String uid,
    required String email,
    required String apellidoMaterno,
    required String apellidoPaterno,
    required String fotoPerfil,
    required String nombres,
    required String numeroCelular,
    required List<String> proyectos,
    required this.ingenieria,
    required this.numeroControl,
  }) : super(
          uid: uid,
          email: email,
          apellidoMaterno: apellidoMaterno,
          apellidoPaterno: apellidoPaterno,
          fotoPerfil: fotoPerfil,
          nombres: nombres,
          numeroCelular: numeroCelular,
          proyectos: proyectos,
          tipoUsuario: "Estudiante",
        );
}

// Colaborador model with an additional 'unidadAdministrativa' field
class Colaborador extends UserModel {
  final String unidadAdministrativa;

  Colaborador({
    required String uid,
    required String email,
    required String apellidoMaterno,
    required String apellidoPaterno,
    required String fotoPerfil,
    required String nombres,
    required String numeroCelular,
    required List<String> proyectos,
    required this.unidadAdministrativa,
  }) : super(
          uid: uid,
          email: email,
          apellidoMaterno: apellidoMaterno,
          apellidoPaterno: apellidoPaterno,
          fotoPerfil: fotoPerfil,
          nombres: nombres,
          numeroCelular: numeroCelular,
          proyectos: proyectos,
          tipoUsuario: "Colaborador",
        );
}
