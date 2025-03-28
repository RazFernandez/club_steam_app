import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // Log out the user and redirect it into the login view
  void _logout() async {
    AuthService authService = AuthService();
    await authService.signout();
    if (mounted) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Has cerrado sesión exitosamente"),
      //   ),
      // );
      ToastManager.info(context, "Has cerrado sesión exitosamente").show();
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
