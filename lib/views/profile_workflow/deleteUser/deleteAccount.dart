import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/Forms/loginForms.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // // Remove
  // final TestFunction testFunction = TestFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset('lib/assets/imgs/Trash_Icon.png', height: 200),
          ],
        ),
      ),
    );
  }
}
