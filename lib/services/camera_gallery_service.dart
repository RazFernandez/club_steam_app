import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  // Method to select a photo from the gallery
  Future<String?> selectPhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (photo == null) return null;
      return photo.path; // Return the file path of the selected photo
    } catch (e) {
      debugPrint('Error selecting photo from gallery: $e');
      return null; // Return null in case of an error
    }
  }

  // Method to take a photo using the camera
  Future<String?> takePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (photo == null) return null;
      return photo.path; // Return the file path of the captured photo
    } catch (e) {
      debugPrint('Error taking photo: $e');
      return null; // Return null in case of an error
    }
  }
}
