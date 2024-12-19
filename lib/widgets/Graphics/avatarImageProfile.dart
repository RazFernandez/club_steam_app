import 'package:flutter/material.dart';
import 'dart:io';

class AvatarImageProfile extends StatelessWidget {
  // Properties
  final double radiusImage;
  final String? networkImageURL;
  final File? localImagefile;

  // Private constructor
  const AvatarImageProfile._(
      {super.key,
      required this.radiusImage,
      this.networkImageURL,
      this.localImagefile});

  // Creates a default image from assets
  const AvatarImageProfile.createFromDefaultImage(
      {Key? key, required radiusImage})
      : this._(key: key, radiusImage: radiusImage);

  // Creates a profile image from an image of Internet
  const AvatarImageProfile.createFromURLImage(
      {Key? key, required String? imageURL, required radiusImage})
      : this._(key: key, networkImageURL: imageURL, radiusImage: radiusImage);

  // Creates a profile image from an image of user files
  const AvatarImageProfile.createFromFileImage(
      {Key? key, required File? localFile, required radiusImage})
      : this._(key: key, localImagefile: localFile, radiusImage: radiusImage);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: localImagefile != null
          // Check if localImagefile is not null
          ? FileImage(
              localImagefile!) // If it's not null, use FileImage and assert it's not null with '!'
          : (networkImageURL != null
              ? NetworkImage(networkImageURL!)
              : AssetImage(
                  'lib/assets/imgs/Profile_Icon.png')), // If both localImagefile and networkImageURL are null, use default image from Assets  '!'
      radius: radiusImage / 2,
    );
  }
}
