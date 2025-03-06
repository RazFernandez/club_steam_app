import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:club_steam_app/providers/linearProgressBar_provider.dart';
import 'package:club_steam_app/widgets/Graphics/linearProgressBar.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';

class RegisterFormView extends StatefulWidget {
  const RegisterFormView({super.key});

  @override
  State<RegisterFormView> createState() => _RegisterFormViewState();
}

class _RegisterFormViewState extends State<RegisterFormView> {
  // Index of the view to be displayed
  int indexView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Registro"),
      ),
      body: ChangeNotifierProvider(
          // Create the provider and set the steps in the LinearProgressBarProvider
          create: (context) => LinearProgressBarProvider(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Keep progress bar at the top
              LinearProgressBar.material(
                minHeight: 5.0,
                context: context,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: IndexedStack(
                  index: indexView,
                  children: <Widget>[],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizableButton(
                      onPressed: () {},
                      text: "Anterior",
                      width: 120,
                      typeOfButton: ButtonType.outlinedButton)
                  //ElevatedButton(onPressed: () {}, child: Text('Anterior')),
                  //ElevatedButton(onPressed: () {}, child: Text('Siguiente'))
                ],
              ),
            ],
          )),
    );
  }
}
