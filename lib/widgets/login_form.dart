import 'package:flutter/material.dart';

import '../componant/color.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTextFormField(
            labelText: 'Email',
            icon: Icon(Icons.email),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextFormField(
            labelText: 'Password',
            isPassword: true,
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            onPressed: () {},
            width: 140,
            height: 5,
            text: 'Login',
            sizetext: 24,
            bgcolor: secondarycolor,
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
