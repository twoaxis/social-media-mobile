import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mobile/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/common/input_fields/custom_text_form_field.dart';
import 'package:social_media_mobile/ui/components/common/misc/errorbox.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/main_scaffold.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  var autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInError) {
          error = state.message;
          setState(() {});
        }
        if (state is LogInSuccess) {
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

                  BlocProvider.of<LogInCubit>(context).logIn(
                    email: email,
                    password: password,
                  );
                } else {
                  setState(
                    () {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    },
                  );
                }
              },
              width: 280,
              height: 40,
              text: 'Login',
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
