import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';
import 'package:social_media_mobile/ui/components/onboarding/sign_up_form.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              const SizedBox(
                height: 27,
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
                height: 20,
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
                    width: 30,
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
                    width: 80,
                    height: 40,
                    text: 'Log in',
                    sizeText: 18,
                    bgColor: primaryColor,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 60),
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
