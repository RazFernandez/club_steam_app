import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login.dart';
import 'package:club_steam_app/widgets/Forms/registerForm.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterForm(),
              SizedBox(height: 16),
              // Register Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RedirectTextButton(
                      navigationMode: 1,
                      labelText: "¿Ya tienes una cuenta?",
                      context: context,
                      targetView: LoginView(),
                      buttonText: "Iniciar Sesión")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
