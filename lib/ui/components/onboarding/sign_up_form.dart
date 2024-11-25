import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_mobile/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/custom_text_form_field.dart';
import 'package:social_media_mobile/ui/components/common/misc/errorbox.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/main_scaffold.dart';

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
  String error = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpError) {
          error = state.message;
          setState(() {});
        }
        if (state is SignUpSuccess) {
          error = state.message;
          setState(() {});
          final navigator = Navigator.of(context);
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScaffold(),
                ),
              );
            }
          });
        }
      },
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            error.isNotEmpty ? Errorbox(content: error) : SizedBox(),
            CustomTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                name = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Name.';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  error = 'Name must be English Letters';
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                username = value!;
              },
              labelText: 'Username',
              icon: Icon(FontAwesomeIcons.at),
              textInputAction: TextInputAction.next,
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
              height: 13,
            ),
            CustomTextFormField(
              onChange: (value) {
                password = value;
              },
              onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
              labelText: 'Password',
              icon: Icon(Icons.lock),
              isPassword: true,
              textInputAction: TextInputAction.next,
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
                    confirmpassword = value;
                  },
                );
              },
              labelText: 'Repeat Password',
              icon: Icon(Icons.lock),
              textInputAction: TextInputAction.done,
              isPassword: true,
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
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var signupCubit = BlocProvider.of<SignUpCubit>(context);
                  signupCubit.signUp(
                      name: name,
                      username: username,
                      email: email,
                      password: password);
                }
              },
              width: 280,
              height: 40,
              text: 'Sign Up',
              sizetext: 24,
              bgcolor: kSecondaryColor,
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
