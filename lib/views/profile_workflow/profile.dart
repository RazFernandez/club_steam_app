import 'package:club_steam_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';
import 'package:club_steam_app/widgets/Buttons/listTitle.dart';
import 'package:go_router/go_router.dart';
import 'package:club_steam_app/widgets/TextWidgets/textDivider.dart';
import 'package:club_steam_app/widgets/Buttons/textButtonIcon.dart';
import 'package:club_steam_app/widgets/Graphics/avatarImageProfile.dart';
import 'package:club_steam_app/widgets/Popups/ConfirmationDialog.dart';
import 'package:club_steam_app/services/Firestores_DB/users_CRUD_DB_service.dart';
import 'package:club_steam_app/widgets/TextWidgets/userInformation.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';
import 'dart:developer';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthService authService = AuthService();
  // Singleton class that saves the data
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  UserController userController = UserController();

  // Log out the user and redirect it into the login view
  void _logout() async {
    await authService.signout();
    if (mounted) {
      // Show a toast message to inform the user that they have logged out successfully
      ToastManager.info(context, "Has cerrado sesión exitosamente").show();
      context.go("/login");
    }
  }

  // Method to Confirm Logout of the user
  void shouldLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "¿Cerrar sesión?",
        text: "¿Estás seguro de que quieres cerrar tu sesión?'",
        onConfirm: () {
          Navigator.pop(context, true);
        },
        onCancel: () {
          Navigator.pop(context, false);
        },
      ),
    );

    if (shouldLogout == true) {
      _logout();
    }
  }

  // Method to display general information of the user
  void retriveUserInfo() async {
    UsersCRUDService usersCRUDService = UsersCRUDService();

    usersCRUDService.fetchUser(authService.getCurrentUserUid()!);
  }

  Future<void> _loadUserData() async {
    String? uid = AuthService().getCurrentUserUid();
    await UserController().loadUser(uid!);

    // After loading data, call setState to rebuild the widget if needed
    setState(() {
      // Update any necessary state here
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Don't await here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: RefreshIndicator(
        onRefresh: _loadUserData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AvatarImageProfile.createFromDefaultImage(radiusImage: 200.0),
                SizedBox(height: 24),
                TextButtonIcon(
                    label: "Cerrar Sesión",
                    leadingIcon: Icons.logout,
                    onPressed: () {
                      shouldLogout();
                      registrationUserFormData.clearFields();
                    }),
                SizedBox(height: 16),
                TextWithDivider(
                  text: 'Información General',
                  textStyleType: AppTextStyleType.titleMedium,
                ),
                UserInformation(
                  uid: authService.getCurrentUserUid()!,
                  fullName: userController.fullName,
                  correoElectronico: userController.correoElectronico,
                  tipoUsuario: userController.tipoUsuario,
                  numeroCelular: userController.numeroCelular,
                  ingenieria: userController.ingenieria,
                  numeroControl: userController.numeroControl,
                  unidadAdministrativa: userController.unidadAdministrativa,
                ),
                SizedBox(height: 24),
                TextWithDivider(
                  text: 'Seguridad de la cuenta',
                  textStyleType: AppTextStyleType.titleMedium,
                ),
                ListTitle(
                  title: 'Cambiar Contraseña',
                  leading: Icon(Icons.key),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    log("Cambiar contra");
                  },
                ),
                ListTitle(
                  title: 'Editar Información',
                  leading: Icon(Icons.edit),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    context.push("/profile/edit-account");
                  },
                ),
                ListTitle(
                  title: 'Borrar Cuenta',
                  leading: Icon(Icons.delete),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    context.push("/profile/delete-account");
                  },
                ),
                SizedBox(height: 24),
                TextWithDivider(
                  text: 'Acerca de la aplicación',
                  textStyleType: AppTextStyleType.titleMedium,
                ),
                ListTitle(
                  title: 'Contactar con soporte técnico',
                  leading: Icon(Icons.email),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    log("Cambiar contra");
                  },
                ),
                ListTitle(
                  title: 'Créditos',
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    log("Cambiar contra");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
