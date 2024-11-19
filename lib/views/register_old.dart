import 'package:flutter/material.dart';
import 'package:club_steam_app/utils/icons.dart';
import 'package:club_steam_app/views/profileImage.dart';
import 'package:club_steam_app/views/login.dart';
import 'package:club_steam_app/widgets/customFormField.dart';
import 'package:club_steam_app/widgets/passwordFormField.dart';
import 'package:club_steam_app/widgets/dropdownFormField.dart';
import 'package:club_steam_app/widgets/redirectTextButton.dart';
import 'package:club_steam_app/utils/validation.dart';
import 'package:club_steam_app/controllers/user_controller_old.dart';
import 'package:club_steam_app/utils/dropdown_items.dart';
import 'package:club_steam_app/utils/navigation_utils.dart';
import 'package:club_steam_app/utils/widget_utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Controllers to retrieve the values of text fields]
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastFatherNameController =
      TextEditingController();
  final TextEditingController _lastMotherNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _controlNumberController =
      TextEditingController();

  // Variables to hold selected dropdown values
  String? selectedUserType;
  String? selectedUnit;

  // Progress tracking
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track current page for progress bar

  // This is the init State function
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _onPageChanged(_pageController.page!.round());
    });
  }

  // This function updates the current page index and rebuilds the progress bar
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  // Method to switch between views
  void switchView(int page) {
    setState(() {
      _currentPage = page; // Set the current page to the passed value
    });
  }

  // Function to render the fields based on the type of user
  Widget _renderContentFields(String? userType) {
    // Both Docente and Estudiante shows a field to select their ingenieria
    if (userType == 'Docente' || userType == 'Estudiante') {
      return Column(
        children: [
          DropdownFormField<String>(
            labelText: 'Ingenieria',
            icon: AppIcons.engineeringIcon,
            items: ingenieriaOptions,
            value: selectedUnit,
            controller: _unitController,
            validator: (value) =>
                isValidField(value, "Por favor, seleccione una opción"),
          ),
          // Just the Estudiantes request their control number
          if (userType == 'Estudiante')
            CustomFormField(
              labelText: 'Número de Control',
              icon: AppIcons.controlNumIcon,
              controller: _controlNumberController,
              validator: (value) => isValidControlNumber(value),
            )
        ],
      );
      // Instead of their ingenieria, the collaborators request their unidad administrativa
    } else if (userType == 'Colaborador') {
      return DropdownFormField<String>(
        labelText: 'Unidad Administrativa',
        icon: AppIcons.unidadAdminIcon,
        items: unidadAdministrativaOptions,
        value: selectedUnit,
        controller: _unitController,
        validator: (value) =>
            isValidField(value, 'Por favor, seleccione una opción'),
      );
    }
    return SizedBox.shrink();
  }

  // Function to validate and submit the registration form
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String? email = _emailController.text;
      String? password = _passwordController.text;
      bool success = await UserController().registerUser(email, password);

      // Whether the creation of the user account was succeful or not, it displays
      // a snackbar
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Su cuenta ha sido creada con éxito')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ha ocurrido un error')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No ha rellenado todos los campos de registro")));
      }
    }
  }

  // Function to render the first page of the registration from
  Widget renderRegisterFormView(BuildContext context) {
    return Column(
      children: <Widget>[
        // Linear progress bar to show step progress
        //LinearProgressIndicator(value: (_currentPage + 1) / 2),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Form key for validation
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Name field
                    CustomFormField(
                        labelText: "Nombres",
                        icon: AppIcons.personIcon,
                        validator: (value) => isValidField(
                            value, 'Por favor, no deje este campo vacio')),
                    // Father Last name
                    CustomFormField(
                        labelText: "Apellido Paterno",
                        icon: AppIcons.personIcon,
                        validator: (value) => isValidField(
                            value, 'Por favor, no deje este campo vacio')),
                    // Mother Last name
                    CustomFormField(
                        labelText: "Apellido Materno",
                        icon: AppIcons.personIcon,
                        validator: (value) => isValidField(
                            value, 'Por favor, no deje este campo vacio')),
                    // Email field
                    CustomFormField(
                        controller: _emailController,
                        labelText: "Correo",
                        icon: AppIcons.emailIcon,
                        validator: (value) => isValidEmail(value)),
                    // Cellphone number field
                    CustomFormField.phoneNumber(
                        labelText: "Número de Celular",
                        icon: AppIcons.phoneIcon,
                        validator: (value) => isValidPhoneNumber(value)),
                    // Type of user field
                    DropdownFormField<String>(
                      labelText: 'Tipo de usuario',
                      icon: AppIcons.typeUserIcon,
                      items: userTypes,
                      value: selectedUserType,
                      controller: _userTypeController,
                      validator: (value) => isValidField(
                          value, 'Por favor, seleccione una opción'),
                      onChanged: (value) {
                        setState(() {
                          selectedUserType = value;
                        });
                      },
                    ),
                    // Rendering content fields based on user type
                    _renderContentFields(selectedUserType),

                    // Password field
                    PasswordFormField(
                        controller: _passwordController,
                        labelText: "Contraseña",
                        validator: (value) => isValidPassword(value)),
                    PasswordFormField(
                        controller: _confirmPasswordController,
                        labelText: "Confirmar Contraseña",
                        validator: (value) => validatePasswords(
                            _passwordController.text,
                            _confirmPasswordController.text)),
                    SizedBox(height: 24),
                    // Register button to submit the form
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          _submitForm();
                          //navigateTo(context, ProfileImageView());
                          //switchView(1);
                        }, // Submit form
                        child: Text('Siguiente'),
                      ),
                    ),
                    SizedBox(height: 16),
                    RedirectTextButton(
                        navigationMode: 1,
                        labelText: "¿Ya tienes una cuenta?",
                        context: context,
                        targetView: LoginView(),
                        buttonText: "Iniciar Sesión")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        leading: IconButton(
          onPressed: () =>
              handleBackNavigation(context, _currentPage, (int newPage) {
            setState(() {
              _currentPage = newPage;
            });
          }),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          // Smooth animation for the progress bar
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: (_currentPage + 1) / 2),
            duration: Duration(milliseconds: 500), // Animation duration
            builder: (context, value, child) {
              return LinearProgressIndicator(value: value);
            },
          ),
          Expanded(
              // Use changeWidgetBodyTree to dynamically change the widget in the body
              child: changeWidgetBodyTree(
            context,
            _currentPage == 0
                ? renderRegisterFormView(context)
                : renderProfileImagePage(context, switchView),
          )),
        ],
      ),
    );
  }
}
