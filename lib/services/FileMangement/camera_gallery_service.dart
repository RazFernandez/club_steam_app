import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:club_steam_app/exceptions/FileOperationException.dart';
import 'package:club_steam_app/services/FileMangement/temporary_storage_service.dart';

/* 
This class uses the ImagePicker package to handle the camera and gallery operations.
The class provides two methods to select an image from the gallery and take a photo 
using the camera. The selected image or photo is saved in the TemporaryStorageService
*/

class CameraGalleryService {
  // Instance of the service
  final ImagePicker _picker = ImagePicker();

  // Method to select a photo from the gallery
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Save the image file in singleton class TemporaryStorageService
        TemporaryStorageService().saveImageFile(File(pickedFile.path));
        debugPrint(
            'SUCCESSFUL OPERATION: THE IMAGE PATH IS: ${pickedFile.path}');
      } else {
        throw FileOperationException(code: "image-not-found");
      }
    } on FileOperationException catch (e) {
      // Save the error message in singleton class TemporaryStorageService
      TemporaryStorageService().saveErrorMessage(e.toString());
    }
  }

  // Method to take a photo using the camera
  Future<void> takePhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        // Save the photo file in singleton class TemporaryStorageService
        TemporaryStorageService().savePhotoFile(File(pickedFile.path));
        debugPrint(
            'SUCCESSFUL OPERATION: THE PHOTO PATH IS: ${pickedFile.path}');
      } else {
        throw FileOperationException(code: "photo-not-found");
      }
    } on FileOperationException catch (e) {
      // Save the error message in singleton class TemporaryStorageService
      TemporaryStorageService().saveErrorMessage(e.toString());
    }
  }

  // // Method to take a photo using the camera
  // Future<XFile?> takePhoto() async {
  //   try {
  //     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       debugPrint(
  //           'SUCCESSFUL OPERATION: THE PHOTO PATH IS: ${pickedFile.path}');
  //       return pickedFile;
  //     } else {
  //       throw FileOperationException(code: "photo-not-found");
  //     }
  //   } on FileOperationException catch (e) {
  //     // Save the error message in singleton class TemporaryStorageService
  //     TemporaryStorageService().saveErrorMessage(e.toString());
  //     return null;
  //   }
  // }

  // // Method to convert XFile to File
  // File? convertXFileToFile(XFile? xFile) {
  //   if (xFile == null) return null;
  //   return File(xFile.path);
  // }
}
