import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/custom_text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            height: 20,
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
            height: 30,
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  Response response = await dio.post(
                    'http://18.193.81.175/auth/login',
                    data: {'email': email, 'password': password},
                  );
                  if (response.statusCode == 200) {
                    String token = response.data['token'];
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('authToken', token);
                    Fluttertoast.showToast(
                      msg: "Logged into your account",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                } on DioException catch (e) {
                  if (e.response?.statusCode == 400) {
                    Fluttertoast.showToast(
                      msg: "Missing or incorrect fields.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else if (e.response?.statusCode == 401) {
                    Fluttertoast.showToast(
                      msg: "Invalid email or password.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                }
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUnfocus;
                });
              }
            },
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
