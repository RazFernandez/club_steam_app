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
import 'dart:developer';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthService authService = AuthService();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: SingleChildScrollView(
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
                  }),
              SizedBox(height: 16),
              TextWithDivider(
                text: 'Información General',
                textStyleType: AppTextStyleType.titleMedium,
              ),
              TextButtonIcon(
                  label: "Recuperar info",
                  leadingIcon: Icons.logout,
                  onPressed: () {
                    retriveUserInfo();
                  }),
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
                  log("Cambiar contra");
                },
              ),
              ListTitle(
                title: 'Borrar Cuenta',
                leading: Icon(Icons.delete),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  log("Cambiar contra");
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
    );
  }
}
