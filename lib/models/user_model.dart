class UserClubSteam {
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correoElectronico;
  final String numeroCelular;
  final String tipoUsuario;
  final String fotoPerfil; // URL to the profile picture
  final List<String> proyectos; // Array of project IDs

  // Constructor
  UserClubSteam({
    required this.nombres,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correoElectronico,
    required this.numeroCelular,
    required this.tipoUsuario,
    required this.fotoPerfil,
    required this.proyectos,
  });

  // Convert a User object to Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'nombres': nombres,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'correoElectronico': correoElectronico,
      'numeroCelular': numeroCelular,
      'tipoUsuario': tipoUsuario,
      'fotoPerfil': fotoPerfil,
      'proyectos': proyectos,
    };
  }

  // Create a User object from Firestore data
  static UserClubSteam fromFirestore(Map<String, dynamic> data) {
    return UserClubSteam(
      nombres: data['nombres'],
      apellidoPaterno: data['apellidoPaterno'],
      apellidoMaterno: data['apellidoMaterno'],
      correoElectronico: data['correoElectronico'],
      numeroCelular: data['numeroCelular'],
      tipoUsuario: data['tipoUsuario'],
      fotoPerfil: data['fotoPerfil'],
      proyectos: List<String>.from(data['proyectos']),
    );
  }
}

// Subclass: Docente
class Docente extends UserClubSteam {
  final String ingenieria;

  Docente({
    required super.nombres,
    required super.apellidoPaterno,
    required super.apellidoMaterno,
    required super.correoElectronico,
    required super.numeroCelular,
    required super.tipoUsuario,
    required super.fotoPerfil,
    required super.proyectos,
    required this.ingenieria,
  });

  @override
  Map<String, dynamic> toFirestore() {
    final data = super.toFirestore();
    data['ingenieria'] = ingenieria;
    return data;
  }

  static Docente fromFirestore(Map<String, dynamic> data) {
    return Docente(
      nombres: data['nombres'],
      apellidoPaterno: data['apellidoPaterno'],
      apellidoMaterno: data['apellidoMaterno'],
      correoElectronico: data['correoElectronico'],
      numeroCelular: data['numeroCelular'],
      tipoUsuario: data['tipoUsuario'],
      fotoPerfil: data['fotoPerfil'],
      proyectos: List<String>.from(data['proyectos']),
      ingenieria: data['ingenieria'],
    );
  }
}

// Subclass: Estudiante
class Estudiante extends UserClubSteam {
  final String ingenieria;
  final String numeroControl;

  Estudiante({
    required super.nombres,
    required super.apellidoPaterno,
    required super.apellidoMaterno,
    required super.correoElectronico,
    required super.numeroCelular,
    required super.tipoUsuario,
    required super.fotoPerfil,
    required super.proyectos,
    required this.ingenieria,
    required this.numeroControl,
  });

  @override
  Map<String, dynamic> toFirestore() {
    final data = super.toFirestore();
    data['ingenieria'] = ingenieria;
    data['numeroControl'] = numeroControl;
    return data;
  }

  static Estudiante fromFirestore(Map<String, dynamic> data) {
    return Estudiante(
      nombres: data['nombres'],
      apellidoPaterno: data['apellidoPaterno'],
      apellidoMaterno: data['apellidoMaterno'],
      correoElectronico: data['correoElectronico'],
      numeroCelular: data['numeroCelular'],
      tipoUsuario: data['tipoUsuario'],
      fotoPerfil: data['fotoPerfil'],
      proyectos: List<String>.from(data['proyectos']),
      ingenieria: data['ingenieria'],
      numeroControl: data['numeroControl'],
    );
  }
}

// Subclass: Colaborador
class Colaborador extends UserClubSteam {
  final String unidadAdministrativa;

  Colaborador({
    required super.nombres,
    required super.apellidoPaterno,
    required super.apellidoMaterno,
    required super.correoElectronico,
    required super.numeroCelular,
    required super.tipoUsuario,
    required super.fotoPerfil,
    required super.proyectos,
    required this.unidadAdministrativa,
  });

  @override
  Map<String, dynamic> toFirestore() {
    final data = super.toFirestore();
    data['unidadAdministrativa'] = unidadAdministrativa;
    return data;
  }

  static Colaborador fromFirestore(Map<String, dynamic> data) {
    return Colaborador(
      nombres: data['nombres'],
      apellidoPaterno: data['apellidoPaterno'],
      apellidoMaterno: data['apellidoMaterno'],
      correoElectronico: data['correoElectronico'],
      numeroCelular: data['numeroCelular'],
      tipoUsuario: data['tipoUsuario'],
      fotoPerfil: data['fotoPerfil'],
      proyectos: List<String>.from(data['proyectos']),
      unidadAdministrativa: data['unidadAdministrativa'],
    );
  }
}
