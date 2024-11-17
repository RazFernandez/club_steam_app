import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login.dart';
import 'package:club_steam_app/widgets/redirectTextButton.dart';

// Assuming renderProfileImagePage is in the same file.
// If it's in another file, make sure to import it correctly.

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// Place this function in the same file or import it from another file
Widget renderProfileImagePage(BuildContext context, Function switchView) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: <Widget>[
            // Title at the top left
            Text(
              'Foto de perfil (Opcional)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 150),
            // Spacer to push the image and text button to the center
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image in the Middle
                  Image.asset(
                    'lib/assets/imgs/Upload_File_Icon.png',
                    height: 200,
                  ),
                  SizedBox(height: 16),
                  // Upload Image Button
                  TextButton(
                    onPressed: () {
                      // Functionality to be added later
                    },
                    child: Text('Subir Imagen'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Buttons at the bottom with optional padding from the bottom
      Positioned(
        bottom: 64,
        left: 16,
        right: 16,
        child: Column(
          children: [
            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    // Change back to the first page (registration form view)
                    switchView(0);
                  },
                  child: Text('Anterior'),
                ),
                SizedBox(width: 16),
                FilledButton(
                  onPressed: () {
                    // Functionality to be added later
                  },
                  child: Text('Crear Cuenta'),
                ),
              ],
            ),
            SizedBox(height: 24), // Gap between buttons and login text
            // Login Text Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RedirectTextButton(
                    labelText: "¿Ya tienes una cuenta?",
                    context: context,
                    targetView: LoginView(),
                    buttonText: "Iniciar Sesión")
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
