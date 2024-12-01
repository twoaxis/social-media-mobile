import 'dart:developer';
import 'package:flutter/material.dart';

class VerificationCodeInput extends StatefulWidget {
  const VerificationCodeInput({
    super.key,
    required this.changeValue,
    required this.length,
  });

  final ValueChanged<String> changeValue;
  final int length;

  @override
  VerificationCodeInputState createState() => VerificationCodeInputState();
}

class VerificationCodeInputState extends State<VerificationCodeInput> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String code = '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) {
          return SizedBox(
            width: 45,
            height: 50,
            child: TextField(
              controller: _controllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
              ),
              onChanged: (value) {
                widget.changeValue(code += value);
                log(code);
                if (value.isNotEmpty) {
                  if (index < 5) {
                    FocusScope.of(context).nextFocus(); // Move to next field
                  } else {
                    FocusScope.of(context).unfocus(); // Dismiss keyboard
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
