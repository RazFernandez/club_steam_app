import 'package:flutter/material.dart';
import 'package:club_steam_app/widgets/TextFields/customFormField.dart';
import 'package:club_steam_app/widgets/Graphics/icons.dart';
import 'package:club_steam_app/utils/validation.dart';

class Fullnameform extends StatefulWidget {
  const Fullnameform({super.key});

  @override
  State<Fullnameform> createState() => _FullnameformState();
}

class _FullnameformState extends State<Fullnameform> {
  // Key to identify the form and perform validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name field
          CustomFormField(
              labelText: "Nombres",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          // Father Last name
          CustomFormField(
              labelText: "Apellido Paterno",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value)),
          // Mother Last name
          CustomFormField(
              labelText: "Apellido Materno",
              icon: AppIcons.personIcon,
              validator: (value) => isValidField(value))
        ],
      ),
    );
  }
}
