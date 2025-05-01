import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextWidgets/textDivider.dart';
import 'package:club_steam_app/widgets/Graphics/avatarImageProfile.dart';
import 'package:club_steam_app/widgets/Forms/registerForms/fullNameForm.dart';
import 'package:club_steam_app/widgets/Forms/editAccountForm/editAccountForm.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/services/Firestores_DB/users_CRUD_DB_service.dart';
import 'package:club_steam_app/controllers/user_controller.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  // GlobalKeys for each form
  final GlobalKey<FormState> _editAccountInfoFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  // Services to communicate with the serverless
  UsersCRUDService usersCRUDService = UsersCRUDService();

  // Singleton class to handle data called to the database
  UserController userController = UserController();

  // Singleton class that saves the data
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Method to validate the form of this view
  bool _validateForm() {
    return _editAccountInfoFormKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AvatarImageProfile.createFromDefaultImage(radiusImage: 200.0),
                SizedBox(height: 24),
                TextWithDivider(
                  text: 'Información General',
                  textStyleType: AppTextStyleType.titleMedium,
                ),
                EditAccountForm(formKey: _editAccountInfoFormKey),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizableButton(
                        onPressed: () {
                          log("Cancelar");
                          Navigator.pop(context);
                        },
                        text: "Cancelar",
                        width: mediumButtonsSize,
                        typeOfButton: ButtonType.outlinedButton),
                    SizableButton(
                      onPressed: () async {
                        if (_validateForm()) {
                          String uid = authService.getCurrentUserUid()!;

                          // Send new data to database
                          await usersCRUDService.updateUserData(
                            uid: uid,
                            nombres: registrationUserFormData.name,
                            apellidoPaterno:
                                registrationUserFormData.lastFatherName,
                            apellidoMaterno:
                                registrationUserFormData.lastMotherName,
                            numeroCelular:
                                registrationUserFormData.cellPhoneNumber,
                          );

                          // Updated the user data in controller
                          await userController.loadUser(uid);

                          // Save the new data in the registrationUserFormData
                          registrationUserFormData.name =
                              userController.nombres!;
                          registrationUserFormData.lastFatherName =
                              userController.apellidoPaterno!;
                          registrationUserFormData.lastMotherName =
                              userController.getApellidoMaterno!;
                          registrationUserFormData.cellPhoneNumber =
                              userController.numeroCelular!;

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                          log("Updated User");
                        }
                      },
                      text: "Editar",
                      width: mediumButtonsSize,
                      typeOfButton: ButtonType.filledButton,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
