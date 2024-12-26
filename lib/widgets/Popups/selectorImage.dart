import 'package:flutter/material.dart';
import 'dart:io';
import 'package:club_steam_app/services/FileMangement/temporary_storage_service.dart';
import 'package:club_steam_app/services/FileMangement/camera_gallery_service.dart';

class SelectorImageBottomSheet extends StatelessWidget {
  const SelectorImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () async {
              // Handle camera selection
              await CameraGalleryService().takePhoto();

              if (TemporaryStorageService().getImageFile() != null) {
                TemporaryStorageService()
                    .cleanImageFile(); // Clean the reference to the image
              }

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Gallery'),
            onTap: () async {
              // Handle gallery selection
              await CameraGalleryService().pickImage();

              if (TemporaryStorageService().getImageFile() != null) {
                TemporaryStorageService()
                    .cleanPhotoFile(); // Clean the reference to the image
              }

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

Future displaySelectorImage(BuildContext context) {
  return showModalBottomSheet(
      context: context, builder: (context) => SelectorImageBottomSheet());
}
