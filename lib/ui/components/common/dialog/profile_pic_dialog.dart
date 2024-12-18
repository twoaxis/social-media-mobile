import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/image_picker.dart';

class ProfilePicDialog extends StatelessWidget {
  const ProfilePicDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: ValueListenableBuilder<File?>(
      valueListenable: selectedProfileImage,
      builder: (context, File? imageFile, child) {
        return selectedProfileImage.value != null
            ? Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageFile != null
                          ? FileImage(imageFile)
                          : const AssetImage('assets/images/Goofycat.jpeg'),
                      fit: BoxFit.cover),
                  border: Border.all(width: 2, color: gray),
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            : Material(
                color: Colors.transparent,
                child: Container(
                  color: Colors.transparent,
                  width: 350,
                  height: 350,
                  child: Center(
                    child: Text(
                      'No Profile Image',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
      },
    ));
  }
}
