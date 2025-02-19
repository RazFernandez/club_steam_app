import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/widgets/Forms/registerForm.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';
import 'package:club_steam_app/widgets/Graphics/linearProgressBar.dart';
import 'package:club_steam_app/controllers/progressBarController.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Instance of the progress bar controller
  // final ProgressBarController _progressBarController =
  //     ProgressBarController(progress: 2.0, steps: 4.0);
  // double xd = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Keep progress bar at the top
          LinearProgressBar.material(
            steps: 2,
            minHeight: 5.0,
            context: context,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RegisterForm(),
                    SizedBox(height: 16),
                    // Register Text
                    FilledButton(
                        onPressed: () {
                          // Call the addStep method from the LinearProgressBar
                          // _progressBarKey.addStep();
                        },
                        child: Text('Siguiente')),
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
            ),
          ),
        ],
      ),
    );
  }
}
