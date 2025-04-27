import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/Graphics/InfoCard.dart';
import 'package:club_steam_app/widgets/Buttons/sizableButtom.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  // // Remove
  // final TestFunction testFunction = TestFunction();

  // Size of the buttons
  final double largeButtonSize = 248;
  final double mediumButtonsSize = 144;
  final double smallButtonsSize = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo Image
                Infocard(
                    iconImageAsset: 'lib/assets/imgs/Trash_Icon.png',
                    description: "¿Estás seguro de eliminar tu cuenta?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizableButton(
                        onPressed: () {
                          context.go('/profile');
                        },
                        text: "Cancelar",
                        width: mediumButtonsSize,
                        typeOfButton: ButtonType.outlinedButton),
                    SizableButton(
                        onPressed: () {},
                        text: "Eliminar",
                        width: mediumButtonsSize,
                        typeOfButton: ButtonType.filledButton),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
