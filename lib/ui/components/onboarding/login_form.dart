import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_credentials_exception.dart';
import 'package:social_media_mobile/services/auth_service.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/custom_text_form_field.dart';
import 'package:social_media_mobile/ui/components/common/misc/errorbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Dio dio = Dio();

  var autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (error.isNotEmpty)
            Errorbox(content: error)
          else
            const SizedBox(
              height: 0,
            ),
          CustomTextFormField(
            onSaved: (value) {
              email = value!;
            },
            labelText: 'Email',
            icon: Icon(Icons.email),
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Email.';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Enter a valid email address';
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
                  password = value;
                },
              );
            },
            labelText: 'Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.next,
            isPassword: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  String token = await AuthService().logIn(email, password);

                  SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('authToken', token);
                    setState(
                      () {
                        error = 'Logged into your account.';
                      },
                    );

                } on InvalidCredentialsExceptions {
                  setState(
                      () {
                        error = 'Invalid email or password.';
                      },
                    );
                  }
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUnfocus;
                  },
                );
              }
            },
            width: 280,
            height: 40,
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
