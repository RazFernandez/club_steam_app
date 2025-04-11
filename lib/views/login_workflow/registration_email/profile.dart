import 'package:flutter/material.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';
import 'package:go_router/go_router.dart';

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
      // Show a toast message to inform the user that they have logged out successfully
      ToastManager.info(context, "Has cerrado sesión exitosamente").show();
      context.go("/login");
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
