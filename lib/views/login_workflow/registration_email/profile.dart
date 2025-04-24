import 'package:flutter/material.dart';
import 'package:club_steam_app/services/Auth/auth_service.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';
import 'package:club_steam_app/widgets/Buttons/listTitle.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('lib/assets/icon/club-steam-logo.png', height: 200),
              SizedBox(height: 24),
              ListTitle(title: '1. Solo título'),
              ListTitle(
                title: '2. Título + onTap',
                onTap: () => log('Tapped 2'),
              ),
              ListTitle(
                title: '3. Título + leading',
                leading: Icon(Icons.star),
              ),
              ListTitle(
                title: '4. Título + trailing',
                trailing: Icon(Icons.chevron_right),
              ),
              ListTitle(
                title: '5. Título + leading + trailing',
                leading: Icon(Icons.folder),
                trailing: Icon(Icons.more_vert),
              ),
              ListTitle(
                title: '6. Título + subtitle',
                subtitle: 'Este es un subtítulo',
                enableSubtitle: true,
                isDense: true,
              ),
              ListTitle(
                title: '7. Título + subtitle + onTap',
                subtitle: 'Este es un subtítulo',
                enableSubtitle: true,
                onTap: () => print('Tapped 7'),
              ),
              ListTitle(
                title: '8. Título + subtitle + thirdLine',
                subtitle: 'Este es un subtítulo',
                thirdLine: 'Tercera línea de texto',
                enableSubtitle: true,
                enableThirdLine: true,
              ),
              ListTitle(
                title: '9. Título + subtitle + thirdLine + leading',
                subtitle: 'Este es un subtítulo',
                thirdLine: 'Información adicional',
                enableSubtitle: true,
                enableThirdLine: true,
                leading: Icon(Icons.info),
              ),
              ListTitle(
                title: '10. Full combo',
                subtitle: 'Proyecto completo',
                thirdLine: 'Estado: Aprobado',
                enableSubtitle: true,
                enableThirdLine: true,
                leading: Icon(Icons.assignment),
                trailing: Icon(Icons.check_circle),
                onTap: () => print('Tapped 10'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
