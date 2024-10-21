import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double height;
  const CustomButton({super.key, required this.onPressed, required this.text, this.width = 0,  this.height = 0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffff4a2b),
        padding:  EdgeInsets.symmetric(
          horizontal: width,
          vertical: height,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
