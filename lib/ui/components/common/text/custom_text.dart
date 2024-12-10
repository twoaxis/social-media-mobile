import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {required this.text,
        super.key,
        this.fontSize,
        this.fontWeight,
        required this.colorName});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String colorName;

  @override
  Widget build(BuildContext context) {
    Map<String, Color> textColor = {
      "red": const Color(0xFFB32C2C),
      "grey": const Color.fromARGB(255, 111, 110, 110),
    };
    return Text(
      softWrap: true,
      maxLines: null,
      overflow: TextOverflow.visible,
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor[colorName],
      ),
    );
  }
}