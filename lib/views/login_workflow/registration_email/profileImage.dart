import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/widgets/Graphics/EditableAvatarImageProfile.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';
import 'package:club_steam_app/widgets/Graphics/linearProgressBar.dart';

class ProfileImageView extends StatefulWidget {
  const ProfileImageView({super.key});

  @override
  State<ProfileImageView> createState() => _ProfileImageViewState();
}

class _ProfileImageViewState extends State<ProfileImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto de perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretches progress bar horizontally
          children: [
            // Keep progress bar at the top
            // LinearProgressBar.material(
            //   steps: 2.0,
            //   minheight: 5.0,
            //   context: context,
            // ),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Editableavatarimageprofile(),
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
                        buttonText: "Iniciar Sesión",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
