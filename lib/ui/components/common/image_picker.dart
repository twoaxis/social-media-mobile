import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<File?> selectedProfileImage = ValueNotifier<File?>(null);

pickProfileImage() async {
  XFile? xFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );

  if (xFile != null) {
    selectedProfileImage.value = File(xFile.path);
  }
}

ValueNotifier<File?> selectedPostImage = ValueNotifier<File?>(null);

pickPostImage() async {
  XFile? xFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );

  if (xFile != null) {
    selectedPostImage.value = File(xFile.path);
  }
}
