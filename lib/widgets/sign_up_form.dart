import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_mobile/widgets/custom_button.dart';
import 'package:social_media_mobile/widgets/custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTextFormField(
            labelText: 'Username',
            icon: Icon(FontAwesomeIcons.user),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            labelText: 'Email',
            icon: Icon(Icons.email),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            labelText: 'Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.next,
            isPassword: true,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            labelText: 'Repeat Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.done,
            isPassword: true,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            width: 40,
            text: 'Sign Up',
          )
        ],
      ),
    );
  }
}
