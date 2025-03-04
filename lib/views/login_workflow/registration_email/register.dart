import 'package:flutter/material.dart';
import 'package:club_steam_app/views/login_workflow/login.dart';
import 'package:club_steam_app/widgets/Forms/registerForm.dart';
import 'package:club_steam_app/widgets/Buttons/redirectTextButton.dart';
import 'package:club_steam_app/widgets/Graphics/linearProgressBar.dart';
import 'package:club_steam_app/providers/linearProgressBar_provider.dart';
import 'package:provider/provider.dart';
import 'package:club_steam_app/widgets/Graphics/EditableAvatarImageProfile.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Index of the view to be displayed
  int indexView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => LinearProgressBarProvider(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Keep progress bar at the top
            LinearProgressBar.material(
              minHeight: 5.0,
              context: context,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IndexedStack(
                    index: indexView,
                    children: <Widget>[
                      Column(
                        children: [
                          RegisterForm(),
                          SizedBox(height: 16),
                          // Register Text
                          Builder(
                            builder: (context) {
                              return FilledButton(
                                onPressed: () {
                                  // Call the addStep method from the LinearProgressBar
                                  Provider.of<LinearProgressBarProvider>(
                                          context,
                                          listen: false)
                                      .incrementStep();

                                  setState(() {
                                    indexView = 1;
                                  });
                                },
                                child: Text('Siguiente'),
                              );
                            },
                          ),
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
                      Editableavatarimageprofile(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
