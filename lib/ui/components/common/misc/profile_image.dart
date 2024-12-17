import 'dart:io';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(this.radius, {super.key});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ValueListenableBuilder<File?>(
        valueListenable: selectedImage,
        builder: (context, File? imageFile, child) {
          return CircleAvatar(
            radius: radius,
            foregroundImage: imageFile != null
                ? FileImage(imageFile) as ImageProvider
                : const AssetImage('assets/images/Goofycat.jpeg'),
          );
        },
      ),
    );
  }
}

class BoundedProfileImage extends StatelessWidget {
  const BoundedProfileImage(this.radius, this.borderWidth, {super.key});

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
      child: ProfileImage(radius),
    );
  }
}
