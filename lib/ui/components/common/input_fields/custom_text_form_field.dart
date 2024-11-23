import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final TextInputAction? textInputAction;
  final bool isPassword;
  final Function(String? value)? onSaved;
  final Function(String value)? onChange;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function(String value)? onFieldSubmitted;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.textInputAction,
    this.isPassword = false,
    this.onSaved,
    this.validator,
    this.onChange,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onFieldSubmitted,
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
        onSaved: widget.onSaved,
        onChanged: widget.onChange,
        validator: widget.validator,
        obscureText: widget.isPassword && obscureText,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: widget.labelText,
          prefixIcon: (widget.icon),
        ),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
