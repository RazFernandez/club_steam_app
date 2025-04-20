// Parent class from types of user extends to.

class UserClubSteam {
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correoElectronico;
  final String numeroCelular;
  final String tipoUsuario;
  final String fotoPerfil;
  final List<String> proyectos;

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

  Map<String, dynamic> toJson() {
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

  // Factory constructor
  factory UserClubSteam.fromJson(Map<String, dynamic> json) {
    switch (json['tipoUsuario']) {
      case 'Docente':
        return Docente.fromJson(json);

      case 'Estudiante':
        return Estudiante.fromJson(json);

      case 'Colaborador':
        return Colaborador.fromJson(json);

      default:
        return UserClubSteam(
          nombres: json['nombres'],
          apellidoPaterno: json['apellidoPaterno'],
          apellidoMaterno: json['apellidoMaterno'],
          correoElectronico: json['correoElectronico'],
          numeroCelular: json['numeroCelular'],
          tipoUsuario: json['tipoUsuario'],
          fotoPerfil: json['fotoPerfil'],
          proyectos: List<String>.from(json['proyectos']),
        );
    }
  }
}

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
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['ingenieria'] = ingenieria;
    return data;
  }

  factory Docente.fromJson(Map<String, dynamic> json) {
    return Docente(
      nombres: json['nombres'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      correoElectronico: json['correoElectronico'],
      numeroCelular: json['numeroCelular'],
      tipoUsuario: json['tipoUsuario'],
      fotoPerfil: json['fotoPerfil'],
      proyectos: List<String>.from(json['proyectos']),
      ingenieria: json['ingenieria'],
    );
  }
}

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
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['ingenieria'] = ingenieria;
    data['numeroControl'] = numeroControl;
    return data;
  }

  factory Estudiante.fromJson(Map<String, dynamic> json) {
    return Estudiante(
      nombres: json['nombres'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      correoElectronico: json['correoElectronico'],
      numeroCelular: json['numeroCelular'],
      tipoUsuario: json['tipoUsuario'],
      fotoPerfil: json['fotoPerfil'],
      proyectos: List<String>.from(json['proyectos']),
      ingenieria: json['ingenieria'],
      numeroControl: json['numeroControl'],
    );
  }
}

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
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['unidadAdministrativa'] = unidadAdministrativa;
    return data;
  }

  factory Colaborador.fromJson(Map<String, dynamic> json) {
    return Colaborador(
      nombres: json['nombres'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      correoElectronico: json['correoElectronico'],
      numeroCelular: json['numeroCelular'],
      tipoUsuario: json['tipoUsuario'],
      fotoPerfil: json['fotoPerfil'],
      proyectos: List<String>.from(json['proyectos']),
      unidadAdministrativa: json['unidadAdministrativa'],
    );
  }
}
