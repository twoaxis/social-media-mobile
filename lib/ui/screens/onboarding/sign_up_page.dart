import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';
import 'package:social_media_mobile/ui/components/common/custom_button.dart';
import 'package:social_media_mobile/ui/components/onboarding/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Create New Account',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              const SignUpForm(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    width: 50,
                    text: 'Log in',
                    sizetext: 18,
                    bgcolor: primarycolor,
                    textcolor: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 60
              ),
              Text(
                '(c) TwoAxis 2024.All rights reserved.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
