import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double height;
  final Color bgColor;
  final Color textColor;
  final double sizeText;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 0,
    this.height = 0,
    required this.bgColor,
    required this.textColor,
    required this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: bgColor,
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
            fontSize: sizeText,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
