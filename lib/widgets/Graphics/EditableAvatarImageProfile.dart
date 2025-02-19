import 'package:flutter/material.dart';
import 'dart:io';
import 'package:club_steam_app/widgets/Graphics/avatarImageProfile.dart';
import 'package:club_steam_app/services/FileMangement/temporary_storage_service.dart';
import 'package:club_steam_app/widgets/Popups/selectorImage.dart';
import 'package:club_steam_app/widgets/Popups/toastMessagge.dart';

class Editableavatarimageprofile extends StatefulWidget {
  const Editableavatarimageprofile({super.key});

  @override
  State<Editableavatarimageprofile> createState() =>
      _EditableavatarimageprofileState();
}

class _EditableavatarimageprofileState
    extends State<Editableavatarimageprofile> {
  File? _selectedImage;

  // Method to change the image selected
  void _selectImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  // Method to handle error messages
  void onErrorMessage(String message) {
    ToastManager.error(context, message).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedImage == null
            ? AvatarImageProfile.createFromDefaultImage(radiusImage: 200.0)
            : AvatarImageProfile.createFromFileImage(
                localFile: _selectedImage, radiusImage: 200.0),
        SizedBox(height: 16),
        TextButton(
            onPressed: () async {
              await displaySelectorImage(context);
              if (TemporaryStorageService().getErrorMessage() != null) {
                ToastManager.error(
                        context, TemporaryStorageService().getErrorMessage()!)
                    .show();
                TemporaryStorageService().cleanErrorMessage();
              } else if (TemporaryStorageService().getPhotoFile() != null) {
                _selectImage(TemporaryStorageService().getPhotoFile()!);
              } else if (TemporaryStorageService().getImageFile() != null) {
                _selectImage(TemporaryStorageService().getImageFile()!);
              }
            },
            child: Text('Cambiar Imagen'))
      ],
    );
  }
}
