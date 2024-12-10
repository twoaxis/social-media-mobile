import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/text/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key, this.function, required this.text, required this.colorName});
  final String text;
  final String colorName;
  VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: const Color.fromARGB(255, 179, 44, 44),
      ),
      onPressed: function,
      child: CustomText(
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        colorName: colorName,
      ),
    );
  }
}
