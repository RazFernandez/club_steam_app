import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextWidgets/titleWithDescription.dart';
import 'package:club_steam_app/controllers/user_controller.dart';

class UserInformation extends StatefulWidget {
  final String uid;

  const UserInformation({
    super.key,
    required this.uid,
  });

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await UserController().loadUser(widget.uid);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userController = UserController();
    String? selectedUserType = userController.tipoUsuario;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithDescription(
          title: "Nombre Completo:",
          description: userController.fullName,
        ),
        TitleWithDescription(
          title: "Correo Electrónico:",
          description: userController.correoElectronico ?? "-",
        ),
        TitleWithDescription(
          title: "Tipo de Usuario",
          description: userController.tipoUsuario ?? "-",
        ),
        if (selectedUserType == "Docente" || selectedUserType == "Estudiante")
          TitleWithDescription(
            title: "Ingenería",
            description: userController.ingenieria ?? "-",
          ),
        if (selectedUserType == "Estudiante")
          TitleWithDescription(
            title: "Número de Control",
            description: userController.numeroControl ?? "-",
          ),
        if (selectedUserType == "Colaborador")
          TitleWithDescription(
            title: "Unidad Académica",
            description: userController.unidadAdministrativa ?? "-",
          ),
        TitleWithDescription(
          title: "Número de Celular",
          description: userController.numeroCelular ?? "-",
        ),
      ],
    );
  }
}
