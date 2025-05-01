import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/Graphics/InfoCard.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:go_router/go_router.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/services/Firestores_DB/users_CRUD_DB_service.dart';
import 'dart:developer';
import 'package:club_steam_app/widgets/Popups/ConfirmationDialog.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  AuthService authService = AuthService();
  UsersCRUDService usersCRUDService = UsersCRUDService();

  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  // Method to Confirm Logout of the user
// Method to Confirm Logout of the user
  Future<bool> shouldDeletedUser(String uid) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "¡Atención!",
        text:
            "Al eliminar tu cuenta, se borrarán permanentemente todos los proyectos que hayas creado y tu información personal. Esta acción es irreversible",
        onConfirm: () {
          Navigator.pop(context, true);
        },
        onCancel: () {
          Navigator.pop(context, false); // Only closes the alertDialog;
        },
      ),
    );

    if (shouldLogout == true) {
      await usersCRUDService.deleteUserService(uid);
      log("User deleted");
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo Image
                Infocard(
                    iconImageAsset: 'lib/assets/imgs/Trash_Icon.png',
                    description: "¿Estás seguro de eliminar tu cuenta?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizableButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Cancelar",
                        width: mediumButtonsSize,
                        typeOfButton: ButtonType.outlinedButton),
                    SizableButton(
                        onPressed: () async {
                          String uid = authService.getCurrentUserUid()!;
                          bool shouldDelete = await shouldDeletedUser(uid);

                          // Only when user deletes their account, singout it
                          if (shouldDelete) {
                            await authService.signout();
                            if (context.mounted) {
                              context.go("/login");
                            }
                          }
                        },
                        text: "Eliminar",
                        width: mediumButtonsSize,
                        typeOfButton: ButtonType.filledButton),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
