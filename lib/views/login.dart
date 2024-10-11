import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/passwordField.dart';
import 'package:club_steam_app/views/register.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          children: <Widget>[
            // Logo Image
            Image.asset('lib/assets/icon/Club_Steam_Logo.png', height: 200),
            SizedBox(
              height: 24,
            ),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Correo Institucional',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // Password TextField
            PasswordTextField(),
            SizedBox(
              height: 24,
            ),
            // Login Button
            SizedBox(
                width: 250,
                child: FilledButton(
                    onPressed: () {}, child: Text('Iniciar Sesión'))),
            SizedBox(
              height: 16,
            ),
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
            SizedBox(
              height: 24,
            ),
            Text("Inicie Sesión con"),

            // Google Sign-In Button
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'lib/assets/icon/google_icon.png',
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              height: 16,
            ),

            // Register Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¿No tienes una cuenta?'),
                TextButton(
                  // Send the user to the registatrion form
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterView()),
                    );
                  },
                  child: Text(
                    'Registrate',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
