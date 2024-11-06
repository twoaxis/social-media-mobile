import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {super.key, required this.title, required this.icon, this.maxLines});
  final String title;
  final Icon icon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * 0.7,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            maxLines: maxLines,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.justify,
            cursorColor: const Color.fromARGB(255, 107, 98, 98),
            initialValue: title,
            style: TextStyle(
                color: Color(0xFFB32C2C),
                fontSize: 14,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.01),
              icon: icon,
              iconColor: const Color.fromARGB(255, 107, 98, 98),
              filled: true,
              fillColor: const Color.fromARGB(255, 247, 247, 247),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xFFB32C2C), width: 2),
              ),
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
