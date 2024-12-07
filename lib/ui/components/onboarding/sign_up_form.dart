import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/exceptions/auth/email_taken_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/exceptions/auth/user_name_taken_exception.dart';
import 'package:social_media_mobile/services/auth_service.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/custom_text_form_field.dart';
import 'package:social_media_mobile/ui/components/common/misc/error_box.dart';
import 'package:social_media_mobile/ui/screens/app/email_verify/email_verify.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  Dio dio = Dio();
  late String email;
  late String name;
  late String username;
  late String password;
  late String confirmPassword;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (error.isNotEmpty)
            ErrorBox(content: error)
          else
            SizedBox(
              height: 0,
            ),
          CustomTextFormField(
            onSaved: (value) {
              name = value!;
            },
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Name.';
              } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                return 'Name must be English Letters';
              }
              return null;
            },
            labelText: 'Name',
            icon: Icon(FontAwesomeIcons.user),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 13,
          ),
          CustomTextFormField(
            onSaved: (value) {
              username = value!;
            },
            labelText: 'Username',
            icon: Icon(FontAwesomeIcons.at),
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter UserName';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 13,
          ),
          CustomTextFormField(
            onSaved: (value) {
              email = value!;
            },
            labelText: 'Email',
            icon: Icon(Icons.email),
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Email.';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'valid email address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            onChange: (value) {
              setState(
                () {
                  password = value;
                },
              );
            },
            labelText: 'Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.next,
            isPassword: true,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 13,
          ),
          CustomTextFormField(
            onChange: (value) {
              setState(
                () {
                  confirmPassword = value;
                },
              );
            },
            labelText: 'Repeat Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.done,
            isPassword: true,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 13,
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  var authService = AuthService();

                  String sessionId =  await authService.signUp(
                    name,
                    username,
                    email,
                    password,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailVerificationScreen(
                        sessionId: sessionId
                      ),
                    ),
                  );
                } on NameNotEnglishException {
                  setState(
                    () {
                      error = '$name must be English letters only.';
                    },
                  );
                } on EmailTakenException {
                  setState(
                    () {
                      error = 'Email Taken';
                    },
                  );
                } on UserNameTakenException {
                  setState(
                    () {
                      error = 'Username Taken';
                    },
                  );
                }
              } else {
                setState(() {
                    autoValidateMode = AutovalidateMode.onUnfocus;
                  },
                );
              }
            },
            width: 280,
            height: 40,
            text: 'Sign Up',
            sizeText: 24,
            bgColor: secondaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}