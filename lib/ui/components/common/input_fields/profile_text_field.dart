import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  ProfileTextField(
      {super.key,
      this.title,
      this.icon,
      this.maxLines,
      this.fontSize,
      required this.color,
      this.fontWeight,
      this.hintText,
      this.width});
  final String? title;
  final String? hintText;
  final double? width;
  final Icon? icon;
  final int? maxLines;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;

  final TextEditingController _profileTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: width ?? constraints.maxWidth * 0.7,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            maxLines: maxLines,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.justify,
            cursorColor: const Color.fromARGB(255, 107, 98, 98),
            initialValue: title,
            style: TextStyle(
                color: color,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w500),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.01),
              icon: icon,
              iconColor: const Color.fromARGB(255, 107, 98, 98),
              filled: true,
              fillColor: const Color.fromARGB(255, 247, 247, 247),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color.fromARGB(131, 158, 158, 158), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color.fromARGB(0, 0, 0, 0), width: 1),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            onSaved: (value) {},
          ),
        );
      },
    );
  }
}
