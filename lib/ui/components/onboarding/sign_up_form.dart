import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/ui/components/common/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/custom_text_form_field.dart';
import 'package:social_media_mobile/data/color.dart';

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
  Dio dio = Dio();
  late String email;
  late String name;
  late String username;
  late String password;
  late String confirmpassword;
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
              name = value!;
            },
            labelText: 'Name',
            icon: Icon(FontAwesomeIcons.at),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              username = value!;
            },
            labelText: 'Username',
            icon: Icon(FontAwesomeIcons.at),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              email = value!;
            },
            labelText: 'Email',
            icon: Icon(Icons.email),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              password = value!;
            },
            labelText: 'Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.next,
            isPassword: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              confirmpassword = value!;
            },
            labelText: 'Repeat Password',
            icon: Icon(Icons.lock),
            textInputAction: TextInputAction.done,
            isPassword: true,
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
                    'http://18.193.81.175/auth/signup',
                    data: {
                      'name': name,
                      'username': username,
                      'email': email,
                      'password': password
                    },
                  );
                  if (response.statusCode == 200) {
                    String token = response.data['token'];
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('authToken', token);
                    Fluttertoast.showToast(
                      msg: "Account created",
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
                      msg: "$name must be English letters only.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else if (e.response?.statusCode == 409) {
                    Fluttertoast.showToast(
                      msg: "E-mail or username taken.",
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
                  },
                );
              }
            },
            width: 140,
            height: 5,
            text: 'Sign Up',
            sizetext: 24,
            bgcolor: secondarycolor,
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}