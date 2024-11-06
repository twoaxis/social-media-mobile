import 'dart:io';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key, required this.radius, required this.borderWidth});
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: const Color.fromARGB(255, 111, 110, 110),
            width: borderWidth),
      ),
      child: ValueListenableBuilder<File?>(
        valueListenable: selectedImage,
        builder: (context, File? imageFile, child) {
          return CircleAvatar(
            radius: radius,
            foregroundImage: imageFile != null
                ? FileImage(imageFile) as ImageProvider
                : const AssetImage('assets/images/Sillycat.jpeg'),
          );
        },
      ),
    );

    // CircleAvatar(
    //   radius: radius,
    //   foregroundImage:
    //  AssetImage(
    //   'assets/images/Sillycat.jpeg',
    // ),
  }
}
