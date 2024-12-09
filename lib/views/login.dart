import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/Forms/loginForms.dart';
import 'package:club_steam_app/views/register.dart';
import 'package:club_steam_app/widgets/redirectTextButton.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Image.asset('lib/assets/icon/club-steam-logo.png', height: 200),
              SizedBox(height: 24),
              // Login form widget from customForms
              LoginForm(),
              SizedBox(height: 16),
              // Recover password
              TextButton(onPressed: () {}, child: Text('Recuperar Contraseña')),
              SizedBox(height: 16),
              // Divider
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text('o'),
                  Expanded(child: Divider())
                ],
              ),
              SizedBox(height: 16),
              Text("Inicie Sesión con"),
              // Google Sing-In Button
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'lib/assets/icon/google_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
              // Register Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RedirectTextButton(
                      labelText: "¿No tienes una cuenta?",
                      context: context,
                      targetView: RegisterView(),
                      buttonText: "Registrate")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
