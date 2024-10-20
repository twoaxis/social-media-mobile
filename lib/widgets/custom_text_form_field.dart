import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextInputAction? textInputAction;
  final bool isPassword;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.textInputAction,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        obscureText: widget.isPassword && obscureText,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  })
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: widget.labelText,
          prefixIcon: Icon(widget.icon),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
