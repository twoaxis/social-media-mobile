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
        minimumSize: Size(width, height),
        backgroundColor: bgcolor,
      ),
      onPressed: onPressed,
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: sizetext,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
