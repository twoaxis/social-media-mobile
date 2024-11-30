import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
    backgroundColor: const Color.fromARGB(237, 69, 69, 69),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
