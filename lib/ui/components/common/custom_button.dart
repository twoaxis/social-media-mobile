import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double height;
  final Color bgcolor;
  final Color textcolor;
  final double sizetext;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 0,
    this.height = 0,
    required this.bgcolor,
    required this.textcolor,
    required this.sizetext,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        padding:  EdgeInsets.symmetric(
          horizontal: width,
          vertical: height,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: sizetext,
          color: textcolor,
        ),
      ),
    );
  }
}
