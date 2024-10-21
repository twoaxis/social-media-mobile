import 'package:flutter/material.dart';
import 'package:social_media_mobile/componant/color.dart';

import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    'asset/image/logo.png',
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const CustomTextFormField(
                  labelText: 'Email',
                  icon: Icons.email,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFormField(
                  labelText: 'Password',
                  isPassword: true,
                  icon: Icons.lock,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondarycolor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("You Don't Have an Account!"),
                      SizedBox(
                        height: 40,
                        width: 130,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primarycolor,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
