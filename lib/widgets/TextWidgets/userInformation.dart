import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextWidgets/titleWithDescription.dart';

class UserInformation extends StatelessWidget {
  final String uid;
  final String fullName;
  final String? correoElectronico;
  final String? tipoUsuario;
  final String? ingenieria;
  final String? numeroControl;
  final String? unidadAdministrativa;
  final String? numeroCelular;

  const UserInformation({
    super.key,
    required this.uid,
    required this.fullName,
    this.correoElectronico,
    this.tipoUsuario,
    this.ingenieria,
    this.numeroControl,
    this.unidadAdministrativa,
    this.numeroCelular,
  });

  @override
  Widget build(BuildContext context) {
    final selectedUserType = tipoUsuario;

    log("toma: $correoElectronico");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithDescription(
          title: "Nombre Completo:",
          description: fullName,
        ),
        TitleWithDescription(
          title: "Correo Electrónico:",
          description: correoElectronico ?? "-",
        ),
        TitleWithDescription(
          title: "Tipo de Usuario",
          description: tipoUsuario ?? "-",
        ),
        if (selectedUserType == "Docente" || selectedUserType == "Estudiante")
          TitleWithDescription(
            title: "Ingenería",
            description: ingenieria ?? "-",
          ),
        if (selectedUserType == "Estudiante")
          TitleWithDescription(
            title: "Número de Control",
            description: numeroControl ?? "-",
          ),
        if (selectedUserType == "Colaborador")
          TitleWithDescription(
            title: "Unidad Académica",
            description: unidadAdministrativa ?? "-",
          ),
        TitleWithDescription(
          title: "Número de Celular",
          description: numeroCelular ?? "-",
        ),
      ],
    );
  }
}
