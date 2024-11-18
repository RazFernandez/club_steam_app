import 'package:flutter/material.dart';
import 'package:club_steam_app/controllers/auth_controller.dart';
import 'package:club_steam_app/views/login.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // Log out the user and redirect it into the login view
  void _logout() async {
    await AuthController().logoutUser();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Has cerrado sesión exitosamente"),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Center(
        child: FilledButton(
          onPressed: _logout,
          child: Text("Cerrar Sesión"),
        ),
      ),
    );
  }
}
