import 'package:club_steam_app/models/user_clubsteam_model.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:club_steam_app/providers/linearProgressBar_provider.dart';
import 'package:club_steam_app/widgets/Graphics/linearProgressBar.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:club_steam_app/widgets/Forms/registerForms/fullNameForm.dart';
import 'package:club_steam_app/widgets/Forms/registerForms/accountContactForm.dart';
import 'package:club_steam_app/widgets/Forms/registerForms/passwordSetupForm.dart';
import 'package:club_steam_app/widgets/Forms/registerForms/userTypeForm.dart';
import 'package:club_steam_app/models/registration_user_form_data.dart';
import 'package:club_steam_app/services/Firestores_DB/user_creationDB_service.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';
import 'package:club_steam_app/exceptions/FirebaseAuthException.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';
import 'package:go_router/go_router.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';
import 'package:club_steam_app/services/firebase_functions/createUserService.dart';

class RegisterFormView extends StatefulWidget {
  const RegisterFormView({super.key});

  @override
  State<RegisterFormView> createState() => _RegisterFormViewState();
}

class _RegisterFormViewState extends State<RegisterFormView> {
  // Object to handle controller values of the text fields
  RegistrationUserFormData registrationUserFormData =
      RegistrationUserFormData();

  // Instance of the user creation service
  UserCreationService userCreationService = UserCreationService();

  // Instance of the authentication service
  AuthService authService = AuthService();

  // Index of the view to be displayed
  int indexView = 0;
  final int totalSteps = 4;

  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  // Visibility of the buttons (Initial state)
  bool isButtonAnteriorVisible = false;
  bool isButtonSiguienteVisible = true;
  bool isButtonCrearCuentaVisible = false;

  // GlobalKeys for each form
  final GlobalKey<FormState> _fullnameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _accountContactFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _userTypeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordSetupFormKey = GlobalKey<FormState>();

  // Method to set the visibility of the buttons
  void _setButtonVisibility() {
    setState(() {
      if (indexView == 0) {
        isButtonAnteriorVisible = false;
        isButtonSiguienteVisible = true;
        isButtonCrearCuentaVisible = false;
      } else if (indexView > 0 && indexView < totalSteps - 1) {
        isButtonAnteriorVisible = true;
        isButtonSiguienteVisible = true;
        isButtonCrearCuentaVisible = false;
      } else if (indexView == totalSteps - 1) {
        isButtonAnteriorVisible = true;
        isButtonSiguienteVisible = false;
        isButtonCrearCuentaVisible = true;
      } else {
        isButtonAnteriorVisible = true;
        isButtonSiguienteVisible = false;
      }
    });
  }

  // Method to increase the index of the view
  void _nextIndexView() {
    setState(() {
      if (indexView < totalSteps - 1) {
        indexView++;
      }
    });
  }

  // Method to decrease the index of the view
  void _previousIndexView() {
    setState(() {
      if (indexView > 0) {
        indexView--;
      }
    });
  }

  // Method to validate the current form
  bool _validateCurrentForm() {
    switch (indexView) {
      case 0:
        return _fullnameFormKey.currentState?.validate() ?? false;
      case 1:
        return _accountContactFormKey.currentState?.validate() ?? false;
      case 2:
        return _userTypeFormKey.currentState?.validate() ?? false;
      case 3:
        return _passwordSetupFormKey.currentState?.validate() ?? false;
      default:
        return false;
    }
  }

  // Method to create the user in the authentication service
  Future<bool> _signup() async {
    bool isSignupSuccessful = false;

    try {
      // final controller = AuthController();
      // await controller.registerUser(
      //     registrationUserFormData.email, registrationUserFormData.password);

      final user = await authService.createUserWithEmailAndPassword(
          registrationUserFormData.email, registrationUserFormData.password);
      CloudFunctionsCreateUserFirestore.sendUserData(
          registrationUserFormData.email, registrationUserFormData.password);
      // if (user != null) {
      //   log("Usuario creado con éxito");

      //   // Send email verification
      //   await authService.sendEmailVerification();

      //   // Create the user object
      //   userCreationService
      //       .setSelectedUserType(registrationUserFormData.userType);

      //   // Save the user id to be the index of the user in the database
      //   String userID = user.uid;

      //   // Create the user object to be saved in the database
      //   UserClubSteam? userToSave =
      //       userCreationService.generateUserToRegister();
      //   if (userToSave != null) {
      //     //userCreationService.addUserDataBase(userToSave, userID);
      //     log("Usuario guardado en la base de datos");
      //     isSignupSuccessful =
      //         true; // Set the value to true if signup is successful
      //   } else {
      //     log("Error al guardar el usuario en la base de datos");
      //   }
      // }
      // // Logout the user to ensure it's not logged in
      await authService.signout();
    } catch (e) {
      isSignupSuccessful = false; // Set the value to false if an error occurs
    }

    return isSignupSuccessful; // Return the value after the try-catch block
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Registro"),
      ),
      body: ChangeNotifierProvider(
          // Create the provider and set the steps in the LinearProgressBarProvider
          create: (context) => LinearProgressBarProvider(totalSteps),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Keep progress bar at the top
                LinearProgressBar.material(
                  minHeight: 5.0,
                  context: context,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IndexedStack(
                    index: indexView,
                    children: <Widget>[
                      Fullnameform(formKey: _fullnameFormKey),
                      AccountContactForm(
                        formKey: _accountContactFormKey,
                      ),
                      UserTypeForm(
                        formKey: _userTypeFormKey,
                      ),
                      PasswordSetupForm(
                        formKey: _passwordSetupFormKey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Builder(builder: (context) {
                  // Buttons to navigate between the views
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Display the buttons according to the index of the view
                      if (isButtonAnteriorVisible)
                        SizableButton(
                            text: "Anterior",
                            width: smallButtonsSize,
                            onPressed: () {
                              // Call the decrementStep method from the LinearProgressBar
                              Provider.of<LinearProgressBarProvider>(context,
                                      listen: false)
                                  .decrementStep();
                              _previousIndexView();
                              _setButtonVisibility();
                              debugPrint(indexView.toString());
                            },
                            typeOfButton: ButtonType.outlinedButton),
                      if (isButtonSiguienteVisible)
                        SizableButton(
                            text: "Siguiente",
                            width: indexView == 0
                                ? largeButtonSize
                                : smallButtonsSize,
                            onPressed: () {
                              if (_validateCurrentForm()) {
                                // Call the addStep method  from the LinearProgressBar
                                Provider.of<LinearProgressBarProvider>(context,
                                        listen: false)
                                    .incrementStep();
                                _nextIndexView();
                                _setButtonVisibility();
                                debugPrint(indexView.toString());
                                debugPrint(registrationUserFormData.name);
                                debugPrint(registrationUserFormData.email);
                                debugPrint(registrationUserFormData.userType);
                                debugPrint(registrationUserFormData.password);
                              }
                            },
                            typeOfButton: ButtonType.filledButton),
                      if (isButtonCrearCuentaVisible)
                        SizableButton(
                            text: "Crear Cuenta",
                            width: mediumButtonsSize,
                            onPressed: () async {
                              if (_validateCurrentForm()) {
                                debugPrint(indexView.toString());
                                // Method to set the user type selected to create the object
                                // to be saved in the database
                                userCreationService.setSelectedUserType(
                                    registrationUserFormData.userType);
                                userCreationService.testUserData();
                                log("User created in the database");

                                // Ensure the account is created in Firebase
                                bool isSignupSuccessful = await _signup();
                                if (isSignupSuccessful && context.mounted) {
                                  context.go("/verify-email");
                                } else {
                                  log("Error during signup process");
                                  // Show error message using ToastManager
                                  String errorMessage =
                                      FirebaseAuthExceptionHandler
                                          .getErrorMessage();

                                  if (context.mounted) {
                                    ToastManager.error(context, errorMessage)
                                        .show();
                                  }
                                }

                                //registrationUserFormData.clearFields();
                              }
                            },
                            typeOfButton: ButtonType.filledButton),
                    ],
                  );
                }),
                // Register Text
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RedirectTextButton(
                      navigationMode: NavigationType.clearStack,
                      labelText: "¿Ya tienes una cuenta?",
                      targetRoute: "/login",
                      buttonText: "Iniciar Sesión",
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
