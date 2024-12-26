/* 
Class that provides temporary storage for files such as images, 
photos, pdf that will be used in the app. This class is used to 
save the files temporarily and then retrieve them when needed.
Also this class provides methods to delete the files when they
are no longer needed to free up space.

This class implements Singleton Desing Pattern to ensure that
only one instance of the class is created and used throughout
the app.
*/

// packages required
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TemporaryStorageService {
  // Singleton instance
  static final TemporaryStorageService _instance = TemporaryStorageService._();

  // Private constructor
  TemporaryStorageService._();

  // Factory consturctor to create a single instance of the class
  factory TemporaryStorageService() => _instance;

  // Variables to store values
  File? imageFile;
  File? photoFile;
  File? pdfFile;
  String? errorMessage;
  String? successMessage;

  // Method to save image file
  void saveImageFile(File file) {
    imageFile = file;
  }

  // Method to retrieve image file
  File? getImageFile() {
    return imageFile;
  }

  // Method to save photo file
  void savePhotoFile(File file) {
    photoFile = file;
  }

  // Method to retrieve photo file
  File? getPhotoFile() {
    return photoFile;
  }

  // Method to save error message
  void saveErrorMessage(String message) {
    errorMessage = message;
  }

  // Method to retrieve error message
  String? getErrorMessage() {
    return errorMessage;
  }

  //method to save pdf file
  void savePdfFile(File file) {
    pdfFile = file;
  }

  //method to retrieve pdf file
  File? getPdfFile() {
    return pdfFile;
  }

  // Method to delete the image file from the temporary storage cache
  Future<void> deleteImageFile() async {
    try {
      if (imageFile != null) {
        await imageFile!.delete();
        imageFile = null;
        debugPrint('SUCCESS: Photo file deleted');
      } else {
        throw FileSystemException('File not found');
      }
    } on FileSystemException catch (e) {
      errorMessage = e.message;
      debugPrint('ERROR: ${e.message}');
    }
  }

  // Method to delete the photo file from the temporary storage cache
  Future<void> deletePhotoFile() async {
    try {
      if (photoFile != null) {
        await photoFile!.delete();
        photoFile = null;
        debugPrint('SUCCESS: Photo file deleted');
      } else {
        throw FileSystemException('File not found');
      }
    } on FileSystemException catch (e) {
      errorMessage = e.message;
      debugPrint('ERROR: ${e.message}');
    }
  }

  // Method to clean the reference to the image file
  void cleanImageFile() {
    imageFile = null;
  }

  // Method to clean the reference to the photo file
  void cleanPhotoFile() {
    photoFile = null;
  }

  // Method to clean the string error message
  void cleanErrorMessage() {
    errorMessage = null;
  }
}
