import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/onboarding/sign_up_page.dart';
import 'package:social_media_mobile/ui/components/onboarding/login_form.dart';
import 'package:social_media_mobile/ui/components/common/button/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.setLoginState});

  final dynamic setLoginState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Login To Your Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LoginForm(
                setLoginState: setLoginState,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      width: 80,
                      height: 40,
                      text: 'Sign up',
                      sizeText: 18,
                      bgColor: primaryColor,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
