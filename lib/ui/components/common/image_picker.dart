import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<File?> selectedImage = ValueNotifier<File?>(null);

pickImage() async {
  XFile? xFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );

  if (xFile != null) {
    selectedImage.value = File(xFile.path);
  }
}